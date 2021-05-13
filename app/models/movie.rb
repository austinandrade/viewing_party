class Movie < ApplicationRecord
  validates_presence_of :title
  has_many :parties
end
