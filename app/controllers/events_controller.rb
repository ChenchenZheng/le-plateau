class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @events = policy_scope(Event).order(created_at: :desc)
    if params[:location].present?
      @events = @events.near(params[:location], 20)
    end
    if params[:category].present?
      sql_query = " \
        boardgames.category ILIKE :category \
      "
      @events = @events.joins(:boardgame).where(sql_query, category: "%#{params[:category]}%")
    end
    if params[:level].present?
      sql_query = " \
        boardgames.level ILIKE :level \
      "
      @events = @events.joins(:boardgame).where(sql_query, level: "%#{params[:level]}%")
    end
    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        info_window: render_to_string(partial: "info_window", locals: { event: event })
      }
    end
  end

  def show
  end

  def new
    @boardgames = Boardgame.all
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    authorize @event
    @user = current_user
    @event.user = @user
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

  def set_event
    @event = Event.find(params[:id])
    authorize @event
  end

  def event_params
    params.require(:event).permit(:boardgame_id, :address, :description, :nb_players, :start_time, :end_time)
  end
end
