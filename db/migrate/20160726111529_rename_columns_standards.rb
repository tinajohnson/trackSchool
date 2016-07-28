class RenameColumnsStandards < ActiveRecord::Migration
  def change
    rename_column :standards, :standard_name, :name
  end
end
