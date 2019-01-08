class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :status
      t.integer :price
      t.integer :package_id
      t.integer :sender_id
      t.integer :carrier_id
      t.integer :reciever_id
      t.string :destintion_address
      t.integer :destintion_zipcode

      t.timestamps
    end
  end
end
