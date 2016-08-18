class AddDefaultValueToSongFeatures < ActiveRecord::Migration
  def change
    change_column :songs, :features, :boolean, default: false
  end
end
