class BathroomsController < ApplicationController
  before_action :get_building

  # Creates a list of all bathrooms in our database
  def index
    @bathrooms = @building.bathrooms.sort_by{|bathroom| bathroom.floor}
  end

  # Displays a specific bathroom.
  # PRE: The bathroom exists
  # POST: We display info about that bathroom
  def show
    @bathroom = @building.bathrooms.find(params[:id])
  end

  # Redirects to a page for creation of a bathroom
  # PRE: None
  # POST: None
  def new
    @bathroom = @building.bathrooms.new(params[:id])
    @genders = ['Male','Female','Unisex']
  end

  # Creates and stores a new bathroom in the database
  # PRE: None
  # POST: A new bathroom is saved in the database
  def create
    @bathroom = @building.bathrooms.new(bathroom_params)
    if @bathroom.save
      redirect_to(building_path(@building))
    else
      render :new
    end
  end

  # Redirects to a page to edit a bathroom
  # PRE: The bathroom exists
  # POST: None
  def edit
    @bathroom = @building.bathrooms.find(params[:id])
    @genders = ['Male','Female','Unisex']
  end

  # Updates a given bathroom
  # PRE: The bathroom exists
  # POST: Changes to the bathroom are stored in the database
  def update
    @bathroom = @building.bathrooms.find(params[:id])
    if @bathroom.update(bathroom_params)
      redirect_to(building_bathrooms_path(@building))
    else
      render :edit
    end
  end

  # Removes a bathroom
  # PRE: The bathroom exists
  # POST: The bathroom is removed from the database
  def destroy
    @bathroom = @building.bathrooms.find(params[:id])
    @bathroom.destroy
    redirect_to(building_bathrooms_path(@building))
  end

  private

  # Specifies the fields that the bathroom has
  # PRE: None
  # POST: None
  def bathroom_params
    params.require(:bathroom).permit(:floor, :location, :gender, :tags)
  end

  # Finds the specific building with the id
  # PRE: That id is tied with a building
  # POST: None
  def get_building
    @building = Building.find(params[:building_id])
  end
end
