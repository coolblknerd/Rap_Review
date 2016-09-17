class AddAttachmentCoverArtToAlbums < ActiveRecord::Migration
  def self.up
    change_table :albums do |t|
      t.attachment :cover_art
    end
  end

  def self.down
    remove_attachment :albums, :cover_art
  end
end
