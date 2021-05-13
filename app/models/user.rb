require 'bcrypt'

class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates :password_digest, presence: true

  has_many :followed_users, foreign_key: :follower_id, class_name: 'Friendship'
  has_many :followees, through: :followed_users
  has_many :following_users, foreign_key: :followee_id, class_name: 'Friendship'
  has_many :followers, through: :following_users

  has_many :parties
  has_many :viewing_party_guests
end
