class Boardgame < ApplicationRecord
  has_many :events
  validates :name, presence: true
  validates :description, length: { minimum: 20 }, presence: true
  validates :category, presence: true
  validates :level, presence: true
  validates :duration, presence: true
end
