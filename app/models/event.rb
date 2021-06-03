class Event < ApplicationRecord
  belongs_to :user
  belongs_to :boardgame
  has_many :reviews
  has_many :participations, dependent: :destroy
  has_one :chatroom, dependent: :destroy
  # has_many :participations
  has_many :users, through: :participations
  validates :address, presence: true
  validates :description, length: { minimum: 20 }, presence: true
  validates :nb_players, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :city, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def completion_percentage
    (((self.participations.select { |p| p.statut == "Accepted" }.count + 1).to_f / (self.nb_players).to_f) * 100).to_i
  end
end
