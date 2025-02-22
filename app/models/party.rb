class Party < ApplicationRecord
  validates :date, presence: true
  validates :start_time, presence: true
  validates :movie_title, presence: true
  validates :duration, numericality: true, presence: true

  belongs_to :user
  has_many :viewing_party_guests, dependent: :destroy
end
