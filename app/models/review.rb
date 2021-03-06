class Review < ApplicationRecord
  belongs_to :event
  belongs_to :from_user, class_name: "User"
  belongs_to :to_user, class_name: "User"
  scope :to_give, -> { where(comment: "") } # scope with lambda
end
