class AddStatusToPackages < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :status, :boolean
  end
end
