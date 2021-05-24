class Event < ApplicationRecord
  belongs_to :user
  belongs_to :boardgame
  has_many :participations
  has_many :users, through: :participations
  validates :address, presence: true
  validates :description, length: { minimum: 20 }, presence: true
  validates :nb_players, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
