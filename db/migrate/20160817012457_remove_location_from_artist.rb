class RemoveLocationFromArtist < ActiveRecord::Migration
  def change
    remove_column :artists, :location
  end
end
