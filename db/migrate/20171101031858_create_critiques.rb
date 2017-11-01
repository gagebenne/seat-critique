class CreateCritiques < ActiveRecord::Migration[5.0]
  def change
    create_table :critiques do |t|
      t.integer :overall_rating
      t.integer :toilet_rating
      t.integer :sink_rating
      t.integer :cleanliness_rating
      t.integer :smell_rating
      t.integer :privacy_rating

      t.integer :user_id
      t.integer :bathroom_id

      t.timestamps
    end
  end
end
