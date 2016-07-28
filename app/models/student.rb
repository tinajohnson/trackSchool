class Student < ActiveRecord::Base
  attr_accessor :standard, :section, :school  #virtual attributes
  validates_presence_of :name
  belongs_to :class_mapping
  has_many :attendances
end
