class Api::V1::Users::GithubOauthController < ApplicationController
  def create
    user = User.find_or_create_by(uid: params[:uid])
    user.uid = params[:uid]
    user.name = params[:name]
    user.email = "githubuser#{rand(0..100)}@github.com"
    user.password = rand(0..1000000).to_s
    user.save!

    render json: UserSerializer.new(user)
  end
end