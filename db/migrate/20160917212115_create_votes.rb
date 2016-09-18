class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.decimal :likes, precision: 3, scale: 1, default: 0.0
      t.decimal :dislikes, precision: 3, scale: 1, default: 0.0
      t.references :song, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
