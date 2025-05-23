class ApplicationController < ActionController::API
  before_action :authenticate_request #toutes les actions sont bloq
  include Pundit::Authorization
  attr_reader :current_user

  private
  # Cette méthode utilise le module Auth::AuthenticateRequest pour vérifier la validité du token et définir l'utilisateur courant. Si le token est invalide ou absent, une réponse 401 est renvoyée.
  def authenticate_request
    @current_user = Auth::AuthenticateRequest.new(request.headers).call
    render json: { error: 'Unauthorized' }, status: :unauthorized unless @current_user
  end
end
