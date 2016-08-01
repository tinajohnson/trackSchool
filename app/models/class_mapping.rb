class ClassMapping < ActiveRecord::Base
  belongs_to :section, foreign_key: :section_id
  belongs_to :standard, foreign_key: :standard_id
  belongs_to :school, foreign_key: :school_id
  validates :school_id,  :uniqueness => {:scope => [:standard_id, :section_id, :school_id] }
end
