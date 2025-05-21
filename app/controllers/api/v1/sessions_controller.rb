class Api::V1::SessionsController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = Auth::JsonWebToken.encode(user_id: user.id)
      render json: { token: token }, status: :ok
    else
      render json: { error: 'Email ou mot de passe invalide' }, status: :unauthorized
    end
  end

  def show
    authorize @current_user
    render json: { user_email: @current_user.email }, status: :ok
  end
end
