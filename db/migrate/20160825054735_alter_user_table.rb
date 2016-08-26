class AlterUserTable < ActiveRecord::Migration
  def up
    remove_column :users, :admin, :boolean, default: false
    add_column :users, :role, :integer
  end

  def down
    add_column :users, :admin, :boolean, default: false
  end
end
