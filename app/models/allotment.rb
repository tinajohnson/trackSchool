class Allotment < ApplicationRecord
  validates :user_id, presence:true
  validates :role, presence:true
  has_many :class_mappings
end
