class RemoveClassMappingFromStudent < ActiveRecord::Migration
  def change
    remove_reference :students, :class_mapping, index: true, foreign_key: true
  end
end
