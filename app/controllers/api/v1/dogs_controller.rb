class Api::V1::DogsController < ApplicationController
  before_action :set_dog, only: %i[ show update destroy ]
  before_action :set_user, only: %i[ create update destroy ]

  def index
    @dogs = Dog.all

    render json: DogSerializer.new(@dogs)
  end

  def show
    render json: DogSerializer.new(@dog)
  end

  def create
    @dog = @user.dogs.new(dog_params)

    if @dog.save
      render json: DogSerializer.new(@dog), status: :created
    else
      render json: { error: @dog.errors.full_messages }, status: :unauthorized
    end
  end

  def update
    # require 'pry'; binding.pry
    @dog = @user.dogs.find(params[:id])
    if @dog.update!(dog_params)
      render json: DogSerializer.new(@dog)
    else
      render json: { error: @dog.errors.full_messages }, status: :not_found
    end
  end

  def destroy
    @dog.destroy!
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_dog
      @dog = Dog.find(params[:id])
    end

    def dog_params
      params.permit(:name, :breed, :age, :size, :neutered)
    end
end
