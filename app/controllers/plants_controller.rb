class PlantsController < ApplicationController
  def index
    plants = Plant.all
    render json: plants
  end

  def show
    plant = find_plant
    render json: plant
  end

  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  def update
    plant = find_plant
    if plant
      plant.update(plant_params)
      render json: plant
    else
      render_not_found_response
    end
  end

  def destroy
    plant = find_plant
    if plant
      plant.destroy
      head :no_content
    else
      render_not_found_response
    end
  end

  private

  def find_plant
    Plant.find(params[:id])
  end

  def plant_params
    params.permit(:name, :image, :price, :is_in_stock)
  end

  def render_not_found_response
    render json: { error: "Plant not found" }, status: :not_found
  end
end
