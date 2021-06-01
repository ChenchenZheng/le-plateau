require "open-uri"

class User < ApplicationRecord
  has_many :given_reviews, class_name: "Review", foreign_key: "from_user_id"
  has_many :received_reviews, class_name: "Review", foreign_key: "to_user_id"
  has_many :events
  has_many :participations
  has_many :requests, through: :events, source: :participations
  has_one_attached :photo
  validates_format_of :phone_number, with: /(?:(?:)0)\s*[1-9](?:[\s.-]*\d{2}){4}/ #, message: "seulement des numéros en 06 et à 10 caractères"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable,
         :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def ordered_requests
    requests.order('created_at DESC')
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      user = User.create(
            email: data.email,
            first_name: data.first_name,
            last_name: data.last_name,
            # photo: data.image,
            password: Devise.friendly_token[0..20]
      )
      avatar = open(data.image)
      user.photo.attach(io: avatar, filename: "user_avatar.jpg")
    end
    user
  end
end
