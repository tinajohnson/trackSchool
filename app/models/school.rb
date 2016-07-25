class School < ActiveRecord::Base
  has_many :class_mappings
  has_many :students
end
