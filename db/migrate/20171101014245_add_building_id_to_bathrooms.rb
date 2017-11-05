class AddBuildingIdToBathrooms < ActiveRecord::Migration[5.0]
  def change
    add_column :bathrooms, :building_id, :integer
  end
end
