class ApplicationController < ActionController::Base
  before_action :passed_event_participed_organized
  before_action :reviews_to_give_for_participants
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :birth_date])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :birth_date])
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def reviews_to_give_for_participants
    passed_events = Event.where("end_time < ?", Time.zone.now)
    @give_reviews_for_participants = passed_events.left_joins(:participations).where(user_id: current_user.id).or(passed_events.left_joins(:participations).where(participations: {user_id: current_user.id})).uniq.map(&:users).flatten.uniq
  end

  def passed_event_participed_organized
    passed_events = Event.where("end_time < ?", Time.zone.now)
    @all_events = passed_events.left_joins(:participations).where(user_id: current_user.id).or(passed_events.left_joins(:participations).where(participations: {user_id: current_user.id})).uniq
    @all_events_with_participants = @all_events.select { |e| e.participations.count > 1 }
  end
end
