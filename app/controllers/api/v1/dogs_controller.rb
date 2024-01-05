class Api::V1::DogsController < ApplicationController
  before_action :set_dog, only: %i[ show update destroy ]

  def index
    @dogs = Dog.all

    render json: DogSerializer.new(@dogs)
  end

  def show
    render json: DogSerializer.new(@dogs)
  end

  def create
    @dog = Dog.new(dog_params)

    if @dog.save
      render json: DogSerializer.new(@dogs), status: :created
    else
      render json: { error: 'Invalid parameters' }, status: :unauthorized
    end
  end

  def update
    if @dog.update(dog_params)
      render json: DogSerializer.new(@dogs)
    else
      render json: { error: 'Invalid parameters' }, status: :not_found
    end
  end

  def destroy
    @dog.destroy!
  end

  private
    def set_dog
      @dog = Dog.find(params[:id])
    end

    def dog_params
      params.require(:dog).permit(:name, :breed, :age, :size, :neutered)
    end
end
