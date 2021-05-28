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
  validates :city, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
