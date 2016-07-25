class Standard < ActiveRecord::Base
  has_many :sections
  # belongs_to :class_mapping
end
