class Allotment < ActiveRecord::Base

  #allotment has class mapping and school id. School id
  #are for school admins and class_mappings are for
  #teachers
  validates :user_id, presence:true
  validates :role, presence:true
  has_many :class_mappings
  belongs_to :user
  belongs_to :school
end
