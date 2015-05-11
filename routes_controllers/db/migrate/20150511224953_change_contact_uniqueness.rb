class ChangeContactUniqueness < ActiveRecord::Migration
  def change
    add_index :contacts, [:user_id, :email], unique: true
    add_index :contact_shares, [:user_id, :contact_id], unique: true
  end
end
