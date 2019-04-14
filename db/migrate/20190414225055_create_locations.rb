class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :city_and_state
      t.float :longitude
      t.float :latitude
      t.string :image_url

      t.timestamps
    end
  end
end
