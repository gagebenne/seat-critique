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
    @genders = gender_options
    @tags = tag_options
  end

  # Creates and stores a new bathroom in the database
  # PRE: None
  # POST: A new bathroom is saved in the database
  def create
    @bathroom = @building.bathrooms.new(bathroom_params)
    if @bathroom.save
      @bathroom.tags.create(tags_hash)
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
    @genders = gender_options
    @tags = tag_options
  end

  # Updates a given bathroom
  # PRE: The bathroom exists
  # POST: Changes to the bathroom are stored in the database
  def update
    @bathroom = @building.bathrooms.find(params[:id])
    if @bathroom.update(bathroom_params)
      @bathroom.tags.destroy_all
      @bathroom.tags.create(tags_hash)
      redirect_to(building_path(@building))
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
    params.require(:bathroom).permit(:floor, :location, :gender)
  end

  # Returns form tags from params as an array of hashes
  def tags_hash
    unless params[:bathroom][:tag_ids].nil?
      params[:bathroom][:tag_ids].reject{ |t| t.empty? }.map{ |t| {name: t} }
    else
      {}
    end
  end

  # An array of tags. These will be boolean options that the bathroom has or does not
  def tag_options
    [ 'Only Blow-Driers',
      'Automatic Toilets',
      'Handicap Accessible',
      'Push-Button Sinks']
  end

  #An array of restroom options.
  #Users registered as male only see Male and Gender-Neutral restrooms
  #Users registered as female only see Female and Gender-Neutral restrooms
  #Users registered as gender-neutral only see Gender-Neutral restrooms
  def gender_options
    ['Male','Female','Gender-Neutral']
  end

  # Finds the specific building with the id
  # PRE: That id is tied with a building
  # POST: None
  def get_building
    @building = Building.find(params[:building_id])
  end
end
