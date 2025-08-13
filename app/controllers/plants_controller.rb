class PlantsController < ApplicationController

  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = Plant.find_by(id: params[:id])
    render json: plant
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

   def update
    plant = Plant.find_by(id: params[:id])
    if plant
      plant.update(plant_params)
      render json: plant
    else
    render json: { error: "Plant not found" }, status: :not_found
    end

  def destroy
    plant = Plant.find_by(id: params[:id])
  if plant
    plant.destroy
    head :no_content
  else
    render json: { error: "Plant not found" }, status: :not_found
    end
  end
end
  private

  def plant_params
    params.permit(:name, :image, :price, :is_in_stock)
  end
end
