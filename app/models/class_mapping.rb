class ClassMapping < ActiveRecord::Base
  has_many :sections, class_name: Section, foreign_key: :section_id
  has_many :standards, class_name: Standard, foreign_key: :standard_id
  has_many :schools, foreign_key: :school_id
  belongs_to :standard
  belongs_to :section
  belongs_to :school
end
