class BathroomsController < ApplicationController
  before_action :get_building

  def index
    @bathrooms = @building.bathrooms.sort_by{|bathroom| bathroom.floor}
  end

  def show
    @bathroom = @building.bathrooms.find(params[:id])
  end

  def new
    @bathroom = @building.bathrooms.new(params[:id])
    @genders = ['Male','Female','Unisex']
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
    @genders = ['Male','Female','Unisex']
  end

  def update
    @bathroom = @building.bathrooms.find(params[:id])
    if @bathroom.update(bathroom_params)
      redirect_to(building_bathrooms_path(@building))
    else
      render :edit
    end
  end

  def destroy
    @bathroom = @building.bathrooms.find(params[:id])
    @bathroom.destroy
    redirect_to(building_bathrooms_path(@building))
  end

  private

  def bathroom_params
    params.require(:bathroom).permit(:floor, :location, :gender)
  end

  def get_building
    @building = Building.find(params[:building_id])
  end
end
