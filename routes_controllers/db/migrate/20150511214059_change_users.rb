class ChangeUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, presence:true, unique: true
    remove_column :users, :name
    remove_column :users, :email
  end
end
