class AddAttachmentProfileToArtists < ActiveRecord::Migration
  def self.up
    change_table :artists do |t|
      t.attachment :profile_img
    end
  end

  def self.down
    remove_attachment :artists, :profile_img
  end
end
