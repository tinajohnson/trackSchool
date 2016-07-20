class RemoveStringFromSection < ActiveRecord::Migration
  def change
    remove_column :sections, :string, :string
  end
end
