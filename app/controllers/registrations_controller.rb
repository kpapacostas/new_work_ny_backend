class Api::RegistrationsController < ApplicationController
    def create
      user = User.create!(
        email: params["data"]["user"]["email"],
        password: params["data"]["user"]["password"],
        password_confirmation: params["data"]["user"]["password"],
        first_name: params["data"]["user"]["first_name"],
        last_name: params["data"]["user"]["last_name"],
        
      )
  
      if user
        cookies.encrypted[:user_id] = user.id
        render json: {
          status: :created,
          user: user
        }
      else
        render json: { status: 422 }
      end
    end
  end