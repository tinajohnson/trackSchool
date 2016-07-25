class Student < ActiveRecord::Base
  belongs_to :standard
  belongs_to :section
  belongs_to :school
end
