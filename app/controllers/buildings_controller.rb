class BuildingsController < ApplicationController

  def index
    @buildings = Building.all
  end

  def show
    @building = Building.find(params['id'])
  end

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(building_params)
    if @building.save
      redirect_to(buildings_path)
    else
      redirect_to(buildings_new_path)
    end
  end

  private

  def building_params
    params.require(:building).permit(:name,:address)
  end
end
