class RemoveDestinationZipcodeFromServices < ActiveRecord::Migration[5.2]
  def change
    remove_column :services, :destination_zipcode, :integer
  end
end
