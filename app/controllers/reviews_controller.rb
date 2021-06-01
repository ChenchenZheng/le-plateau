class ReviewsController < ApplicationController
  def index
    @reviews = policy_scope(Review).order(created_at: :desc)
    @event = Event.find(params[:event_id])
    @other_participations = @event.participations.where.not(user_id: current_user) # I note everyone but me
  end

  def edit
    @review = Review.find(params[:id])
    @event = Event.find(params[:event_id])
    authorize @review
  end

  def update
    @review = Review.find(params[:id])
    authorize @review
    @event = Event.find(params[:event_id])
    if @review.update(review_params)
      redirect_to event_reviews_path
    else
      render :edit
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :to_user_id, :rating)
  end
end
