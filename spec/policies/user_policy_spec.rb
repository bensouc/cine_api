require 'rails_helper'

RSpec.describe UserPolicy, type: :policy do
  let(:user) { create(:user) }

  subject { described_class }

  describe 'Session' do
    it "autorise la show de la session" do
      policy = UserPolicy.new(user, user)
      expect(policy.show?).to be true
    end
  end
end
