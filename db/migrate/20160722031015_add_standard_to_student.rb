class AddStandardToStudent < ActiveRecord::Migration
  def change
    add_reference :students, :standard, index: true, foreign_key: true
    add_reference :students, :section, index: true, foreign_key: true
    add_reference :students, :school, index: true, foreign_key: true
  end
end
