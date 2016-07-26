ActiveAdmin.register Student do
  permit_params :student_name, :class_mapping_id, :standard, :section, :school
  index do
    selectable_column
    column :id
    column :student_name
    column "Standard" do |i|
      i.class_mapping.standard.standard_name
    end
    column "Section" do |i|
      i.class_mapping.section.section_name
    end
    column "School" do |i|
      i.class_mapping.school.school_name
    end
    actions
  end

  def student_params
    params.require(:student).permit(:student_name, :class_mapping_id, :standard, :section, :school)
  end
  #
  controller do
    def create
      create!
        @student = Student.new
        class_mapping_id = ClassMapping.where(:standard_id => params[:standard], :section_id => params[:section],
                                              :school_id => params[:school]).pluck(:id).first
        @student.class_mapping_id = class_mapping_id
    end
  end




  form do |f|
    f.inputs "Student Details" do
      f.input :student_name, :as => :string
      f.input :school, :as => :select, :collection => School.all.collect { |school| [school.school_name, school.id] }
      f.input :standard, :as => :select, :collection => Standard.all.collect { |standard| [standard.standard_name, standard.id] }
      f.input :section, :as => :select, :collection => Section.all.collect { |section| [section.section_name, section.id] }
    end
    f.actions
  end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end






end
