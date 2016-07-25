class Student < ActiveRecord::Base
  validates_presence_of :student_name
  belongs_to :class_mapping
  has_many :attendances
end
