class Api::V1::UsersController < ApplicationController

  def create
    @user = User.new(user_params)  

    if @user.save
      @user.gen_api_key
      render json: UserSerializer.new(@user), status: 201
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def show
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: UserSerializer.new(user), status: 200
    else
      render json: { error: 'Incorrect log-in information' }, status: :bad_request
    end
  end


  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
