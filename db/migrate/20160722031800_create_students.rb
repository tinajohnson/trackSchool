class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :student_name
      t.references :standard, foreign_key: true, index: true
      t.references :section, foreign_key: true, index: true
      t.references :school, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end
