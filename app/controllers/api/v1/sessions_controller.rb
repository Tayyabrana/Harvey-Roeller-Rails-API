class Api::V1::SessionsController < ApplicationController
    # skip_before_action :verify_authenticity_token
  
    # POST /api/v1/login
    def create
      user = User.find_by(email: params[:email])
      if user&.valid_password?(params[:password])
        render json: { message: 'Login successful', user: user }, status: :ok
      else
        render json: { errors: ['Invalid email or password'] }, status: :unauthorized
      end
    end
  end
  