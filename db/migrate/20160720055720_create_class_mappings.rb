class CreateClassMappings < ActiveRecord::Migration
  def change
    create_table :class_mappings do |t|
      t.timestamps null: false
    end
  end
end
