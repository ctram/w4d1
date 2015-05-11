class CreateContactsAndContactShares < ActiveRecord::Migration
  def change
    create_table :contact_shares do |t|
      t.integer :contact_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

      create_table :contacts do |t|
        t.string :name, null: false
        t.string :email, null: false, unique: true
        t.integer :user_id, null: false, unique: true

        t.timestamps
    end

    add_index :contacts, :user_id
  end
end
