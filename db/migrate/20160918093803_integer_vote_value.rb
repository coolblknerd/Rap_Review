class IntegerVoteValue < ActiveRecord::Migration
  def change
    change_column :votes, :likes, :integer, default: 0
    change_column :votes, :dislikes, :integer, default: 0
  end
end
