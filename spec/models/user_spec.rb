require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password_digest) }
  end

  describe "secure password" do
    it "has secure password" do
      user = User.new(email: "test@example.com", password: "password", password_confirmation: "password")
      expect(user.authenticate("password")).to be_truthy
    end
  end
end
