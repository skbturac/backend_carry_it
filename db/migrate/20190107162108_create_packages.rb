class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.integer :weight
      t.integer :height
      t.integer :length
      t.string :description
      t.string :image
      t.references :sender #packages ... outgoing ... sending
      t.references :receiver #incoming_packages

      t.timestamps
    end
  end
end
