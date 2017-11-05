class CreateBathrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :bathrooms do |t|
      t.string :floor
      t.string :location
      t.string :gender

      t.timestamps
    end
  end
end
