class UserSocials < ApplicationController
  before_action :set_social, only: %i[:create]
  before_action :set_user, only: %i[:create]

  def create
    user_id = params[:user_id]
    social_id = params[:social_id]
    if user_id.blank? || social_id.blank?
      render json: {message: "Validation failed: User can't be blank, social can't be blank"}, status: :bad_request
    else
      begin
        user = User.find(user_id)
        social = Social.find(social_id)
        raise ActiveRecord::RecordNotUnique if UserSocial.where(user: user, social: social).exists?
        UserSocial.create!(user: user, social: social)
        render json: {message: "Successfully added venfor to user"}, status: :created
      rescue ActiveRecord::RecordInvalid => exception
        render json: ErrorSerializer.new(ErrorMessage.new(exception.message, :unprocessable_entity)).serialize, status: 404
      rescue ActiveRecord::RecordNotUnique => exception
        render json: ErrorSerializer.new(ErrorMessage.new("user social with the same user_id and vendor_id already exists"))
      end
    end
  end

  def create 
    require 'pry'; binding.pry
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end

  def set_social
    @social = Social.find(params[:social_id])
  end
end