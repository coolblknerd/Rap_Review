class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, null: false, default: ""
    change_column :users, :role, :integer, null: false, default: 0
  end
end
