class Api::V1::SessionsController < Api::V1::BaseController
  def create
    user = User.find_by_email(user_params[:email])
    if user && user.authenticate(user_params[:password])
      render status: 200, json: {
                                  "api_key": "#{user.api_key}"
                                }
    else
      render status: 403, json: {
                                  "errors": "Invalid email and/or password"
                                }
    end

  end

  def user_params
    params.permit(:email, :password)

  end
end
