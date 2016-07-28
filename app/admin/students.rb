ActiveAdmin.register Student do
  permit_params :name, :class_mapping_id, :standard, :section, :school
  index do
    selectable_column
    column :id
    column :name
    column "Standard" do |i|
      i.class_mapping.standard.name
    end
    column "Section" do |i|
      i.class_mapping.section.name
    end
    column "School" do |i|
      i.class_mapping.school.name
    end
    actions
  end

  def student_params
    params.require(:student).permit(:name, :class_mapping_id, :standard, :section, :school)
  end



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
      f.input :name, :as => :string
      f.input :school, :as => :select, :collection => School.all.collect { |school| [school.name, school.id] }
      # f.input :standard, :as => :select, :input_html => {'data-option-dependent' => true, 'data-option-url' => '/admin/standards', 'data-option-observed' => 'student_school'}, :collection => @standards.collect {|standard| {:id => standard.id, :name => standard.name} }
      # f.input :standard, :as => :select, :collection => Standard.all.collect { |standard| [standard.name, standard.id] }
      # f.input :section, :as => :select, :collection => Section.all.collect { |section| [section.name, section.id] }
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
