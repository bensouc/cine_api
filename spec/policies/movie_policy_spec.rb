require 'rails_helper'

RSpec.describe MoviePolicy, type: :policy do
  let(:user) { create(:user) }
  let(:movie) { create(:movie) }

  subject { described_class }

  describe 'Scope' do
    let!(:movie1) { create(:movie) }
    let!(:movie2) { create(:movie) }
    let(:scope) { Pundit.policy_scope!(user, Movie) }

    it 'retourne au maximum 580 films avec les associations' do
      expect(scope).to include(movie1, movie2)
      expect(scope.limit_value).to eq(580)
    end
  end

  describe '#create?' do
    it "autorise la création d'un film" do
      policy = MoviePolicy.new(user, movie)
      expect(policy.create?).to be true
    end
  end
end
