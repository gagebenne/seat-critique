class CritiquesController < ApplicationController
  before_action :get_building_and_bathroom
  before_action :authenticate_user!

  # Creates a list of all critiques for that bathroom
  def index
    @critiques = @bathroom.critiques
    @current_user_critiques = @critiques.select{ |c| c.user == current_user }
    @other_user_critiques = @critiques.reject{ |c| c.user == current_user }
  end

  # Displays a specific critique.
  # PRE: The critique exists
  # POST: We display info about that critique
  def show
    @critique = @bathroom.critiques.find(params[:id])
  end

  # Redirects to a page for creation of a critique
  # PRE: None
  # POST: None
  def new
    @critique = @bathroom.critiques.new
    @rating_symbols = rating_symbols
  end

  # Creates and stores a new critique in the database
  # PRE: None
  # POST: A new critique is saved in the database
  def create
    @critique = @bathroom.critiques.new(critique_params)
    @critique.user_id = current_user.id
    if @critique.save
      redirect_to(building_bathroom_path(@building,@bathroom))
    else
      render :new
    end
  end

  # Redirects to a page to edit a critique
  # PRE: The critique exists
  # POST: None
  def edit
    @critique = @bathroom.critiques.find(params[:id])
    @rating_symbols = rating_symbols
  end

  # Updates a given critique
  # PRE: The critique exists
  # POST: Changes to the critique are stored in the database
  def update
    @critique = @bathroom.critiques.find(params[:id])
    if @critique.update(critique_params)
      redirect_to(building_bathroom_path(@building,@bathroom))
    else
      render :new
    end
  end

  # Removes a critique
  # PRE: The critique exists
  # POST: The critique is removed from the database
  def destroy
    @critique = @bathroom.critiques.find(params[:id])
    @critique.destroy
    redirect_to(building_bathroom_critiques_path(@building,@bathroom))
  end

  private

  # Specifies the fields that the critique has
  # PRE: None
  # POST: None
  def critique_params
    params.require(:critique).permit(:overall_rating,:toilet_rating,:sink_rating,:cleanliness_rating,:smell_rating,:privacy_rating)
  end

  def rating_symbols
    [:overall_rating,:toilet_rating,:sink_rating,:cleanliness_rating,:smell_rating,:privacy_rating]
  end

  # Finds the building/bathroom with the specified id
  # PRE: That id is tied to a building/bathroom pair
  # POST: None
  def get_building_and_bathroom
    @building = Building.find(params[:building_id])
    @bathroom = @building.bathrooms.find(params[:bathroom_id])
  end
end
