class Attendance < ActiveRecord::Base
  validates_presence_of :student_id
  validates_presence_of :attendance
  validates_presence_of :Date
  belongs_to :student
end
