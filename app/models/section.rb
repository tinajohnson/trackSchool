class Section < ActiveRecord::Base
  validates_presence_of :name
  with_options :dependent => :destroy do |a|
    a.has_many :class_mappings
  end
end
