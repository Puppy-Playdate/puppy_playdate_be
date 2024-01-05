class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]

  # GET /api/v1/users
  def index
    @users = User.all

    render json: UserSerializer.new(@users)
  end

  # GET /api/v1/users/1
  def show
    render json: UserSerializer.new(@user)
  end

  # POST /api/v1/users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: UserSerializer.new(@user), status: :created
    else
      render json: { error: @user.errors.full_messages }, status: :unauthorized
    end
  end

  # PATCH/PUT /api/v1/users/1
  def update
    if @user.update(user_params)
      render json: UserSerializer.new(@user), status: :accepted
    else
      render json: { error: 'Invalid parameters' }, status: :not_found
    end
  end

  # DELETE /api/v1/users/1
  def destroy
    @user.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:name, :email, :password)
    end
end
