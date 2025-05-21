require 'rails_helper'

RSpec.describe 'Api::V1::Sessions', type: :request do
  describe 'POST /api/v1/sessions' do
    let!(:user) { User.create(email: 'test@example.com', password: 'password', password_confirmation: 'password') }

    context 'avec des identifiants valides' do
      it 'retourne un token' do
        post '/api/v1/login', params: { email: user.email, password: 'password' }
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to have_key('token')
      end
    end

    context 'avec des identifiants invalides' do
      it 'retourne une erreur' do
        post '/api/v1/login', params: { email: user.email, password: 'mauvais' }
        expect(response).to have_http_status(:unauthorized)
        expect(JSON.parse(response.body)).to have_key('error')
      end
    end
  end

  describe 'GET /api/v1/sessions' do
    let!(:user) { User.create(email: 'show@example.com', password: 'password', password_confirmation: 'password') }
    let(:token) { Auth::JsonWebToken.encode(user_id: user.id) }

    it "retourne l'email de l'utilisateur courant" do
      get '/api/v1/session', headers: { 'Authorization' => "Bearer #{token}" }
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['user_email']).to eq(user.email)
    end
  end
end
