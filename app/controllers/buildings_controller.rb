class BuildingsController < ApplicationController

  # Shows the map
  # PRE: None
  # POST: The map is displayed, and markers are on the buildings' coordinates
  def index
    @buildings = Building.all
    @markers_hash = Gmaps4rails.build_markers(@buildings) do |building, marker|
      marker.title building.name.downcase
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

  # Displays a specific building.
  # PRE: The building exists
  # POST: We display info about that building
  def show
    @building = Building.find(params[:id])
    if user_signed_in?
      @bathrooms = @building.bathrooms.select{ |br| br.gender.downcase == current_user.gender.to_s.downcase || br.gender == 'Gender-Neutral'}
    else
      @bathrooms = @building.bathrooms
    end
  end

  # Redirects to a page for creation of a building
  # PRE: None
  # POST: None
  def new
    @building = Building.new
  end

  # Creates and stores a new building in the database
  # PRE: None
  # POST: A new building is saved in the database
  def create
    @building = Building.new(building_params)
    if @building.save
      redirect_to(buildings_path)
    else
      render :new
    end
  end

  # Redirects to a page to edit a building
  # PRE: The building exists
  # POST: None
  def edit
    @building = Building.find(params[:id])
  end

  # Updates a given building
  # PRE: The building exists
  # POST: Changes to the building are stored in the database
  def update
    @building = Building.find(params[:id])
    if @building.update(building_params)
      redirect_to(buildings_path)
    else
      render :edit
    end
  end

  # Removes a building
  # PRE: The building exists
  # POST: The building is removed from the database
  def destroy
    @building = Building.find(params[:id])
    @building.destroy
    redirect_to(buildings_path)
  end

  private

  # Specifies the fields that the building has
  # PRE: None
  # POST: None
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
