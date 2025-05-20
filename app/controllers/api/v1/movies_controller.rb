class Api::V1::MoviesController < ApplicationController
  def index
    @movies = Movie.limit(580).includes(:director, :actors)
  end
end
