class PlantsController < ApplicationController
  def index
    plants = Plant.all
    render json: plants, status: :ok
  end

  def show
    plant = Plant.find_by(id: params[:id])
    if plant
      render json: plant, status: :ok
    else
      render json: { error: "Plant not found" }, status: :not_found
    end
  end

  def create
    plant = Plant.new(plant_params)
    if plant.save
      render json: plant, status: :created
    else
      render json: { errors: "plant not created" }, status: :unprocessable_entity
    end
  end

  protected

  def plant_params
    params.permit(:name, :image, :price)
  end
end
  
