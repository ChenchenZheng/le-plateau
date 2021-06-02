class CreateNilReviewJob < ApplicationJob
  queue_as :default

  def perform
    yesterday_events = Event.where(end_time: 1.day.ago.all_day)
    yesterday_events.each do |event|
      host = event.user
      participants = event.users
      users = participants << host
      from_to_users = users.map(&:id).combination(2).to_a
      from_to_users += from_to_users.map(&:reverse)

      from_to_users.each do |from_user, to_user|
        Review.create(
          comment: "",
          rating: "",
          from_user_id: from_user,
          to_user_id: to_user,
          event: event
        )
      end
    end
  end
end
