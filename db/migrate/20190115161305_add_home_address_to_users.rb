class AddHomeAddressToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :home_address, :string
  end
end
