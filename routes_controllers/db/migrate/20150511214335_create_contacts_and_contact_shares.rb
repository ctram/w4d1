class CreateContactsAndContactShares < ActiveRecord::Migration
  def change
    create_table :contact_shares do |t|
      t.integer :contact_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.integer :user_id, null: false

      t.timestamps
  end
end
