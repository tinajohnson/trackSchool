class Section < ActiveRecord::Base
  has_one :standard
  # belongs_to :class_mapping
end
