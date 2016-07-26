class ClassMapping < ActiveRecord::Base
  belongs_to :section, class_name: Section, foreign_key: :section_id
  belongs_to :standard, class_name: Standard, foreign_key: :standard_id
  belongs_to :school, foreign_key: :school_id
end
