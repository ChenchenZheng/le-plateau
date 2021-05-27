class User < ApplicationRecord
  has_many :events
  has_many :participations
  has_many :requests, through: :events, source: :participations
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def ordered_requests
    requests.order('created_at DESC')
  end
end
