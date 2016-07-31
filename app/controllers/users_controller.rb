class UsersController < InheritedResources::Base

 def index
    @users = User.where(role: 'teachers')
  end

  def teacher

  end

  def display
        @users = User.where(role: 'teacher')
        #binding.pry
  end

  def teacher_delete
      id = params["id"]
      t = Allotment.find(id)
      t.destroy

      redirect_to manage_teachers_path ,  flash: {alert: "Allotment deleted!" }
  end

  def teacher_allot_classes
    @id = params["id"]
  end

  def class_alloted
     user_id = params["id"]
     # std = params["standard"]
     # sec = params["section"]
     mapping_id = params["class"]

     # mapping_id = 0
     #
     # std_id = Standard.find_by_standard_name(std)
     # sec_id = Section.find_by_section_name(sec)
     #
     #
     # c_map = ClassMapping.all
     # c_map.each do |c_map|
     #   if (c_map.standard_id == std_id.id && c_map.section_id == sec_id.id)
     #     mapping_id = c_map.id
     #   end
     # end

    t = ClassMapping.find(mapping_id.to_i)
    school_id = t.school_id

    t = Allotment.new
    t.user_id= user_id.to_i
    t.school_id = school_id
    t.class_mappings_id = mapping_id
    t.role = "Teacher"
    t.save

     redirect_to manage_teachers_path ,  flash: {alert: "Class alloted to teacher" }

     end

    def render_404
      render 'users/error'
    end

end
