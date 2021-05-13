class Party < ApplicationRecord
  validates :date, presence: true
  validates :start_time, presence: true
  validates :duration, numericality: true, presence: true

  belongs_to :user
  belongs_to :movie
  has_many :viewing_party_guests
end
