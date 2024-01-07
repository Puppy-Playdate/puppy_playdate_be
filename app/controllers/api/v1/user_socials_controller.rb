class UserSocials < ApplicationController
  before_action :set_social
  before_action :set_user
  before_action :set_dog

  private
  def set_user
    @user = User.find(params[:user_id])
  end

  def set_dog
    @dog = Dog.find(params[:id])
  end 

  def set_social
    @social = Social.find(params[:social_id])
  end
end