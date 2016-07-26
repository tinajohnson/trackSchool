class UsersController < ApplicationController
  def teacher

  end

  def teacher_delete
      id = params["id"]
      t = Allotment.find(id)
      t.destroy
  end

  def teacher_allot_classes
    @id = params["id"]
  end

  def class_alloted
     user_id = params["id"]
     std = params["standard"]
     sec = params["section"]

     mapping_id = 0

     std_id = Standard.find_by_standard_name(std)
     sec_id = Section.find_by_section_name(sec)


     c_map = ClassMapping.all
     c_map.each do |c_map|
       if (c_map.standard_id == std_id.id && c_map.section_id == sec_id.id)
         mapping_id = c_map.id
       end
     end

    t = ClassMapping.find(mapping_id)
    school_id = t.school_id

    t = Allotment.new
    t.user_id= user_id.to_i
    t.school_id = school_id
    t.class_mappings_id = mapping_id
    t.role = "Teacher"
    t.save

  end

end
