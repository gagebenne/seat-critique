class BathroomsController < ApplicationController
  before_action :get_building
  
  def index
    @bathrooms = @building.bathrooms
  end

  def show
    @bathroom = @building.bathrooms.find(params[:id])
  end

  def new
    @bathroom = @building.bathrooms.new(params[:id])
  end

  def create
    @bathroom = @building.bathrooms.new(bathroom_params)
    if @bathroom.save
      redirect_to(building_path(@building))
    else
      render :new
    end
  end

  def edit
    @bathroom = @building.bathrooms.find(params[:id])
  end

  def update
    @bathroom = @building.bathrooms.find(params[:id])
    if @bathroom.update(bathroom_params)
      redirect_to(building_path(@building))
    else
      redirect_to :edit
    end
  end

  def destroy
    @bathroom = @building.bathrooms.(building_id: params[:building_id])
    @bathroom.destroy
    redirect_to(building_path(@building))
  end
  
  private
  
  def bathroom_params
    params.require(:bathroom).permit(:floor, :location, :gender)
  end
  
  def get_building
    @building = Building.find(params[:building_id])
  end
end


