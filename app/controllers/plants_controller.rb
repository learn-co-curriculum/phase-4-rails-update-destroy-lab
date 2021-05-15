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

  # PATCH /plants/:id
  def update
    plant = Plant.find_by(id: params[:id])
    plant.update(plant_params)
    render json: plant
  end

  # DELETE /plants/:id
  def destroy
    plant = Plant.find_by(id: params[:id])
    plant.destroy
    head :no_content
  end

  private

  def plant_params
    params.permit(:name, :image, :price, :is_in_stock)
  end
end
