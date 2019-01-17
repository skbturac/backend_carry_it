class AddDeliveryDateToPackages < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :delivery_date, :string
  end
end
