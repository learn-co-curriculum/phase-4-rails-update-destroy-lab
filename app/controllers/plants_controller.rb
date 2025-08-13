class PlantsController < ApplicationController
  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    if plant = find_plant
      render json: plant
    else
      render_not_found_response
    end
  end

  # POST /plants
  def create
    if plant = Plant.create(plant_params)
      render json: plant, status: :created
    else
      render_not_found_response
    end
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

  def render_not_found_response
    render json: { error: 'Plant not found' }, status: :not_found
  end

  def plant_params
    params.permit(:name, :image, :price, :is_in_stock)
  end

  def find_plant
    Plant.find_by(id: params[:id])
  end
end
