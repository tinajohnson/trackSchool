class RenameColumnsStudent < ActiveRecord::Migration
  def change
    rename_column :students, :student_name, :name
  end
end
