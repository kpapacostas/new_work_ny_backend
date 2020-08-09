class RegistrationsController < ApplicationController
    def create
      user = User.create!(
        email: params["data"]["email"],
        password: params["data"]["password"],
        password_confirmation: params["data"]["password_confirmation"],
        first_name: params["data"]["first_name"],
        last_name: params["data"]["last_name"],
        
      )
      if user
        cookies.encrypted[:user_id] = user.id
        render json: {
          status: :created,
          user: user
        }
      else
        render json: { status: 422, params: params }
      end
    end
  end