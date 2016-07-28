class RenameColumnsSections < ActiveRecord::Migration
  def change
    rename_column :sections, :section_name, :name
  end
end
