class RemoveStringFromStandard < ActiveRecord::Migration
  def change
    remove_column :standards, :string, :string
  end
end
