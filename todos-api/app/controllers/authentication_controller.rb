class AuthenticationController < ApplicationController

  skip_before_action :authorize_request, only: :authenticate

  def authenticate

    email = auth_params[:email]
    password = auth_params[:password]

    auth_token =
        AuthenticateUser.new(email, password).call

    json_response auth_token: auth_token

  end

  private

  def auth_params

    params.permit(:email, :password)

  end

end
