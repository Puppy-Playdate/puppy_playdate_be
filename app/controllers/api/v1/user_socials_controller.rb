class UserSocials < ApplicationController
  before_action :set_social
  before_action :set_user

  private
  def set_user
    @user = User.find(params[:user_id])
  end

  def set_social
    @social = Social.find(params[:social_id])
  end
end