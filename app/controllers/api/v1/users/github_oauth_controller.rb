class Api::V1::Users::GithubOauthController < ApplicationController
  def create
    user = User.find_or_create_by(uid: params[:uid])
    user.uid = params[:uid]
    user.name = params[:name]
    require 'pry'; binding.pry
    user.save!

    render json: UserSerializer.new(user)
  end
end