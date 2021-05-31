class ReviewsController < ApplicationController
  def index
    @reviews = policy_scope(Review).order(created_at: :desc)
    @event = Event.find(params[:event_id])
    @to_users = @event.users
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
