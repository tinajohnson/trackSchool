class School < ActiveRecord::Base
  validates_presence_of :school_name
  validates_presence_of :school_location
  validates_presence_of :school_contact
  has_many :class_mappings
  has_many :students
  has_many :users
  has_many :allotments
end
