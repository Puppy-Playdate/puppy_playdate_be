class DogsController < ApplicationController
  before_action :set_dog, only: %i[ show update destroy ]

  # GET /dogs
  def index
    @dogs = Dog.all

    render json: DogSerializer.new(@dogs)
  end

  # GET /dogs/1
  def show
    render json: DogSerializer.new(@dogs)
  end

  # POST /dogs
  def create
    @dog = Dog.new(dog_params)

    if @dog.save
      render json: DogSerializer.new(@dogs), status: :created
    else
      render json: { error: 'Invalid parameters' }, status: :unauthorized
    end
  end

  # PATCH/PUT /dogs/1
  def update
    if @dog.update(dog_params)
      render json: DogSerializer.new(@dogs)
    else
      render json: { error: 'Invalid parameters' }, status: :not_found
    end
  end

  # DELETE /dogs/1
  def destroy
    @dog.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dog
      @dog = Dog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dog_params
      params.require(:dog).permit(:name, :breed, :age, :size, :neutered)
    end
end
