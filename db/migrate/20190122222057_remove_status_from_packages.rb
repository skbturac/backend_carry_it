class RemoveStatusFromPackages < ActiveRecord::Migration[5.2]
  def change
    remove_column :packages, :status, :boolean
  end
end
