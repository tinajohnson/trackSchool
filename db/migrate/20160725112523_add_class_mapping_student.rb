class AddClassMappingStudent < ActiveRecord::Migration
  def change
    add_reference :students, :class_mapping, foreign_key:true
    remove_reference :students, :standard, index: true, foreign_key: true
    remove_reference :students, :section, index: true, foreign_key: true
    remove_reference :students, :school, index: true, foreign_key: true
  end
end
