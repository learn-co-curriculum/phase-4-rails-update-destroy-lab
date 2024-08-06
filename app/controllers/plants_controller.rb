class PlantsController < ApplicationController
  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = find_plant_by_id
    render json: plant
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  def update
    plant = find_plant_by_id
    plant.update(plant_params)
    render json: plant
  end

  def destroy
    plant = find_plant_by_id
    plant.destroy
  end

  private

  def plant_params
    params.permit(:name, :image, :price, :is_in_stock)
  end

  def find_plant_by_id
    Plant.find_by(id: params[:id])
  end
end
