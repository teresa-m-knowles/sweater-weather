class Api::V1::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.api_key = generate_key
    if @user.save
      render status: 201, json: {
                                  "api_key": "#{@user.api_key}"
                                }
    else
      render status: 400, json: {errors: @user.errors.full_messages.to_sentence}
    end
  end

  private

  def generate_key
    SecureRandom.urlsafe_base64
  end

  def user_params
    params.permit(:email, :password, :password_confirmation)

  end


end
