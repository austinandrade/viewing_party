class ViewingPartyGuest < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :party, dependent: :destroy
end
