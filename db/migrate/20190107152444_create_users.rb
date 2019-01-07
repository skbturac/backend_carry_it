class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :bio
      t.string :avatar
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.string :phone_number
      t.integer :service_id
      t.integer :package_id
      t.integer :sender_id
      t.integer :carrier_id


      t.timestamps
    end
  end
end
