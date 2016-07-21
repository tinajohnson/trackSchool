class AddStandardtoClassMappings < ActiveRecord::Migration
  def change
    add_reference :class_mappings, :standard, foreign_key: true
    add_reference :class_mappings, :section, foreign_key: true
    add_reference :class_mappings, :school, foreign_key: true
  end
end
