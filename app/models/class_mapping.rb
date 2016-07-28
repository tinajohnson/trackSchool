class ClassMapping < ActiveRecord::Base
  belongs_to :section, foreign_key: :section_id
  belongs_to :standard, foreign_key: :standard_id
  belongs_to :school, foreign_key: :school_id
end
