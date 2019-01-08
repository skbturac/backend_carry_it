class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :status
      t.integer :price
      t.string :destination_address
      t.integer :destination_zipcode
      t.integer :package_id
      # t.integer :sender_id
      # t.integer :carrier_id
      # t.integer :receiver_id
      t.references :sender
      t.references :carrier
      t.references :receiver

      t.timestamps
    end
  end
end
