class School < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :location
  validates_presence_of :contact
  has_many :class_mappings
  has_many :students
  has_many :users
  has_many :allotments
end
