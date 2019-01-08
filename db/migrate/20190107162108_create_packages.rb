class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.integer :weight
      t.integer :height
      t.integer :length
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
