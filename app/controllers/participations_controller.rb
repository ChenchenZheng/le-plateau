class ParticipationsController < ApplicationController
  before_action :set_participation, only: %i[accept decline destroy]

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

  def accept
    @participation.statut = "Accepted"
    @participation.save
    redirect_to dashboard_path(tab: params[:tab])
  end

  def decline
    @participation.statut = "Declined"
    @participation.save
    redirect_to dashboard_path(tab: params[:tab])
  end

  def destroy
    @participation.destroy
    redirect_to events_path
  end

  private

  def set_participation
    @participation = Participation.find(params[:id])
    authorize @participation
  end
end
