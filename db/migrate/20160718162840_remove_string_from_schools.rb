class RemoveStringFromSchools < ActiveRecord::Migration
  def change
    remove_column :schools, :string, :string
  end
end
