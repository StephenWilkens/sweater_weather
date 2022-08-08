class Api::V1::UsersController < ApplicationController

  def create
    require "pry"; binding.pry
    @user = User.new(user_params)
    

    if @user.save
      @user.gen_api_key
      render json: UserSerializer.new(@user)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end



  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
