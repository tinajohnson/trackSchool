class DropStudentsTable < ActiveRecord::Migration
  def up
    drop_table :students
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
