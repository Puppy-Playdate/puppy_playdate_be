class Api::V1::Users::GithubOauthController < ApplicationController
  def create
    user = User.find_or_create_by(uid: params[:uid])
    user.name = params[:name]
    user.email = params[:email]
    user.uid = params[:uid]
    user.oauth_token = params[:access_token]
    user.password = "#{params[:uid]}#{params[:email]}#{params[:uid]}"
    user.save!

    render json: UserSerializer.new(user)
  end
end