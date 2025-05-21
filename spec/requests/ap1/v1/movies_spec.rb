require 'rails_helper'

RSpec.describe "Api::V1::Movies", type: :request do
  describe "GET /api/v1/movies" do
    let!(:user) { User.create(email: "show@example.com", password: "password", password_confirmation: "password") }
    let(:token) { Auth::JsonWebToken.encode(user_id: user.id) }
    let!(:director) { Director.create(name: "Spielberg") }
    let!(:movie1) { Movie.create(title: "Jurassic Park", description: "Dinos", year: 1993, director: director) }
    let!(:movie2) { Movie.create(title: "E.T.", description: "Alien", year: 1982, director: director) }

    it "retourne une liste des movies" do
      get "/api/v1/movies", headers: {
        "Authorization" => "Bearer #{token}",
        "Accept" => "application/json"
      }
      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json).to be_an(Array)
      titles = json.map { |m| m["title"] }
      expect(titles).to include("Jurassic Park", "E.T.")
    end
  end
end
