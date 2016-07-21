class ClassMappingController < ApplicationController
  def assign
    render template: "class_mappings/assign_teacher"
  end
end