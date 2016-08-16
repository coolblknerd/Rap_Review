class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.text :bio
      t.string :location
      t.string :name
      t.string :origin

      t.timestamps null: false
    end
  end
end
