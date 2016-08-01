ActiveAdmin.register Student do
  permit_params :standard, :section, :school, :name, :class_mapping_id
  index do
    selectable_column
    column :id
    column :name
    column "Class" do |i|
      i.class_mapping.standard.name+'-'+i.class_mapping.section.name
    end
    column "School" do |i|
      i.class_mapping.school.name
    end
    actions
  end

  # form :partial => 'new_student_creation'

  # member_action :get_classes, method: :get, format: 'json' do
  #   permitted_params = params.permit( :id )
  #
  #   classes = ClassMapping.where( school_id: permitted_params[:id] ).first
  #   response_hash[:classes] = classes
  #   render json: response_hash and return
  # end

  form do |f|
    f.inputs "Student Details" do
      f.input :name
      f.input :school, :as=> :select, :collection => School.all.collect{|school| [school.name, school.id]}

      f.input :class_mapping_id, :as => :select, :collection => ClassMapping.uniq.collect { |classes| [classes.standard.name+'-'+classes.section.name, classes.id] }
    end
    f.actions
  end


end
