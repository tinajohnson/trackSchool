class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :student_name
      t.references :class_mapping, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end
