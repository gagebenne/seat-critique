class BuildingsController < ApplicationController
  def index
    @buildings = Building.all
    @markers_hash = Gmaps4rails.build_markers(@buildings) do |building, marker|
      marker.lat building.latitude
      marker.lng building.longitude
      marker.infowindow info_window_html(building)
      marker.picture({
        :url => ActionController::Base.helpers.asset_path("emoticon-poop.png"),
        :width => 36,
        :height => 36
        })
    end
    @markers_as_json = @markers_hash.to_json
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

  def info_window_html(building)
    building.name+"\r"+
    "<br>\r"+
    building.address+"\r"+
    "<a class=\"btn btn-default\" href=\"/buildings/#{building.id}\">Show</a>"
  end
end
