class Movie < ApplicationRecord
  validates :title, presence: true
  has_many :parties, dependent: :destroy
end
