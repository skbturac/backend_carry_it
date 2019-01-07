class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.integer :weight
      t.integer :height
      t.integer :lenght
      t.integer :width
      t.integer :price
      t.string :description
      t.string :destintion_address
      t.integer :destintion_zipcode
      t.string :image
      t.integer :service_id
      t.integer :sender_id
      t.integer :carrier_id

      t.timestamps
    end
  end
end
