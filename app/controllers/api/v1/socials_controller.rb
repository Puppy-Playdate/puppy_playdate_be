class Api::V1::SocialsController < ApplicationController
  before_action :set_social, only: %i[ show update destroy ]
  before_action :set_user, only: %i[ create update destroy ]

  # GET /api/v1/socials
  def index
    @socials = Social.all

    render json: SocialSerializer.new(@socials)
  end

  # GET /api/v1/socials/1
  def show
    render json: SocialSerializer.new(@social)
  end

  # POST /api/v1/user_id/socials
  def create
    require 'pry'; binding.pry
    @social = @user.socials.new(social_params)

    if @social.save
      render json: SocialSerializer.new(@social), status: :created
    else
      render json: { error: @social.errors.full_messages }, status: :unauthorized
    end
  end

  # PATCH/PUT /api/v1/socials/1
  def update
    if @social.update(social_params)
      render json: SocialSerializer.new(@social)
    else
      render json: { error: @social.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/socials/1
  def destroy
    @social.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_social
      @social = Social.find(params[:id])
    end

    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def social_params
      params.permit(:name, :description, :event_type, :event_date, :location)
    end
end