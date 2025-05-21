class Api::V1::MoviesController < ApplicationController
  def index
    @movies = policy_scope(Movie)
  end

  def create
    @movie = Movie.new(movie_params)
    authorize @movie
    if @movie.save
      render json: @movie, status: :created
    else
      render json: {
        "errors": [
          {
            "status": '422',
            "title": 'Movie creation failed',
            "detail": "#{@movie.errors.full_messages.join(', ')}"
          }
        ]
      }, status: :unprocessable_entity
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :year, :director_id, actor_ids: [])
  end
end
