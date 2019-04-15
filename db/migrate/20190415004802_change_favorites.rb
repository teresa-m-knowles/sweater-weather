class ChangeFavorites < ActiveRecord::Migration[5.2]
  def change
    add_index :favorites, [:location_id, :user_id], unique: true
  end
end
