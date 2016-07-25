class Section < ActiveRecord::Base
  # has_one :standard
  # belongs_to :class_mapping
  validates_presence_of :section_name
end
