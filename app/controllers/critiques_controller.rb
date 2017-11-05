class CritiquesController < ApplicationController
  before_action :get_building_and_bathroom
  before_action :authenticate_user!

  def index
    @critiques = @bathroom.critiques
  end

  def show
    @critique = @bathroom.critiques.find(params[:id])
  end

  def new
    @critique = @bathroom.critiques.new
  end

  def create
    @critique = @bathroom.critiques.new(critique_params)
    @critique.user_id = current_user.id
    if @critique.save
      redirect_to(building_bathroom_critiques_path(@building,@bathroom))
    else
      render :new
    end
  end

  def edit
    @critique = @bathroom.critiques.find(params[:id])
  end

  def update
    @critique = @bathroom.critiques.find(params[:id])
    if @critique.update(critique_params)
      redirect_to(building_bathroom_critiques_path(@building,@bathroom))
    else
      render :new
    end
  end

  def destroy
    @critique = @bathroom.critiques.find(params[:id])
    @critique.destroy
    redirect_to(building_bathroom_critiques_path(@building,@bathroom))
  end

  private

  def critique_params
    params.require(:critique).permit(:overall_rating,:toilet_rating,:sink_rating,:cleanliness_rating,:smell_rating,:privacy_rating)
  end

  def get_building_and_bathroom
    @building = Building.find(params[:building_id])
    @bathroom = @building.bathrooms.find(params[:bathroom_id])
  end
end
