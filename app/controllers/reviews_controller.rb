class ReviewsController < ApplicationController
  def index
    @reviews = policy_scope(Review).order(created_at: :desc)
    @event = Event.find(params[:event_id])
    @other_participations = @event.participations.where.not(user_id: current_user) # I note everyone but me
  end

  def new
    @review = Review.new(to_user_id: params[:to_user_id])
    @event = Event.find(params[:event_id])
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    authorize @review
    @event = Event.find(params[:event_id])
    @review.event = @event
    @review.from_user = current_user
    if @review.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :to_user_id, :rating)
  end
end
