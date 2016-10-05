class RemoveLikesFromVote < ActiveRecord::Migration
  def change
    remove_column :votes, :likes
    remove_column :votes, :dislikes
  end
end
