class Api::V1::RegistrationsController < ApplicationController
    # Skip CSRF token verification for API requests
    # skip_before_action :verify_authenticity_token
  
    # POST /api/v1/signup
    def create
      user = User.new(user_params)
      if user.save
        render json: { message: 'User created successfully', user: user }, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name)
    end
  end
  