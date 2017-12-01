class TagController < ApplicationController

  #This actually does nothing right now; the tags are being stored in bathrooms_controller
  def new
    @tags = ['Handicap Accessible', 'No Paper Towels', 'Automatic Toilets']
  end

  def create

  end

  def edit

  end

  def update

  end

  private

  def tag_params

  end
end
