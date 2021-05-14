require 'bcrypt'

class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates :password_digest, presence: true

  has_many :followed_users, foreign_key: :follower_id, class_name: 'Friendship', inverse_of: :follower,
                            dependent: :destroy
  has_many :followees, through: :followed_users
  has_many :following_users, foreign_key: :followee_id, class_name: 'Friendship', inverse_of: :followee,
                             dependent: :destroy
  has_many :followers, through: :following_users

  has_many :parties, dependent: :destroy
  has_many :viewing_party_guests, dependent: :destroy

  before_save :down_case_email

  def down_case_email
    email.downcase! if email
  end
end
