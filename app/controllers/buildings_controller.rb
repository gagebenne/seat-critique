class BuildingsController < ApplicationController
  def index
    @buildings = Building.all
    @hash = Gmaps4rails.build_markers(@buildings) do |building, marker|
      marker.lat building.latitude
      marker.lng building.longitude
      marker.infowindow render_to_string(:partial => "layouts/infowindow", :locals => { :building => building})
    end
  end

  def show
    @building = Building.find(params[:id])
    @bathrooms = @building.bathrooms
  end

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(building_params)
    if @building.save
      redirect_to(buildings_path)
    else
      render :new
    end
  end

  def edit
    @building = Building.find(params[:id])
  end

  def update
    @building = Building.find(params[:id])
    if @building.update(building_params)
      redirect_to(buildings_path)
    else
      render :edit
    end
  end

  def destroy
    @building = Building.find(params[:id])
    @building.destroy
    redirect_to(buildings_path)
  end

  private

  def building_params
    params.require(:building).permit(:name, :address)
  end
end
