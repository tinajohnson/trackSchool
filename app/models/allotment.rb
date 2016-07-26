class Allotment < ActiveRecord::Base
  validates :user_id, presence:true
  validates :role, presence:true
  has_many :class_mappings
  belongs_to :user
  belongs_to :school
end
