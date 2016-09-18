class ModifyVotes < ActiveRecord::Migration
  def change
      change_column :votes, :likes, :float, default: 0, null: false
      change_column :votes, :dislikes, :float, default: 0, null: false
  end
end
