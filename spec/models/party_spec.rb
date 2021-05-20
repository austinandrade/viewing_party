require 'rails_helper'

RSpec.describe Party, type: :model do
  describe "validations" do
    it { should validate_presence_of :date }
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :movie_title }
    it { should validate_presence_of :duration }
    it { should validate_numericality_of :duration }
  end

  describe "relationships" do
    it { should belong_to(:user) }
    it { should have_many(:viewing_party_guests) }
  end
end
