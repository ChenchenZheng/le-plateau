class ParticipationsController < ApplicationController
  def new
    @participation = Participation.new
    authorize @participation
    @event = Event.find(params[:event_id])
  end

  def create
    @participation = Participation.new
    authorize @participation
    @event = Event.find(params[:event_id])
    @participation.event = @event
    @participation.user = current_user
    if @participation.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end
end
