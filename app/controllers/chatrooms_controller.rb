class ChatroomsController < ApplicationController
  def show
    @event = Event.find(params[:event_id])
    @chatroom = Chatroom.find(@event.chatroom_id)
    @message = Message.new
    authorize @chatroom
  end
end
