class AddLatitudeAndLongitudeToBuildings < ActiveRecord::Migration[5.0]
  def change
    add_column :buildings, :latitude, :float
    add_column :buildings, :longitude, :float
  end
end
