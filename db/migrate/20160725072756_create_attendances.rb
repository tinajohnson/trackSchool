class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.string :student_id
      t.string :integer
      t.string :attendance
      t.date :Date

      t.timestamps null: false
    end
  end
end
