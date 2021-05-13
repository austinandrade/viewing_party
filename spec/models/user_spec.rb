require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password_digest }

  end

  describe "relationships" do
    it { should have_many(:followed_users) }
    it { should have_many(:followees).through(:followed_users) }
    it { should have_many(:following_users) }
    it { should have_many(:followers).through(:following_users) }
    it { should have_many(:viewing_party_guests) }
    it { should have_many(:parties) }
  end

  describe 'class methods' do
    describe "#down_case_email" do
      it "verifies that it downcases an incoming email" do
        user = User.create!(email: 'BOBSBURGErs123@gmail.com', password: '123')
        expect(user.email).to eq('bobsburgers123@gmail.com')
      end
    end
  end
end
