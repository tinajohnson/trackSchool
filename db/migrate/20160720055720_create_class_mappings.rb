class CreateClassMappings < ActiveRecord::Migration
  def change
    create_table :class_mappings do |t|
      add_reference :class_mappings, :standard, foreign_key: true
      add_reference :class_mappings, :section, foreign_key: true
      add_reference :class_mappings, :school, foreign_key: true
      t.timestamps null: false
    end
  end
end
