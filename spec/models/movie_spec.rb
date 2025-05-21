require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "associations" do
    it { should belong_to(:director) }
    it { should have_many(:roles) }
    it { should have_many(:actors).through(:roles) }
  end

  describe "validations" do
    it "is valid with valid attributes" do
      director = create(:director)
      movie = build(:movie, director: director)
      expect(movie).to be_valid
    end

    it "is invalid without a title" do
      movie = build(:movie, title: nil)
      expect(movie).not_to be_valid
    end

    it "is invalid without a director" do
      movie = build(:movie, director: nil)
      expect(movie).not_to be_valid
    end
  end

  describe "actors through roles" do
    it "returns the correct actors" do
      movie = create(:movie)
      actor1 = create(:actor)
      actor2 = create(:actor)
      create(:role, movie: movie, actor: actor1)
      create(:role, movie: movie, actor: actor2)
      expect(movie.actors).to match_array([actor1, actor2])
    end
  end
end
