ActiveAdmin.register ClassMapping do

  permit_params :standard_id, :section_id, :school_id
  index do
    selectable_column
    column :id
    column "Standard" do |i|
      i.standard.standard_name
    end
    column "Section" do |i|
      i.section.section_name
    end
    column "School" do |i|
      i.school.school_name
    end
    actions
  end


  form do |f|
    f.inputs "Class Details" do
      f.input :standard_id, :as => :select, :collection => Standard.all.collect { |standard| [standard.standard_name, standard.id] }
      f.input :section_id, :as => :select, :collection => Section.all.collect { |section| [section.section_name, section.id] }
      f.input :school_id, :as => :select, :collection => School.all.collect { |school| [school.school_name, school.id] }
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
#   content do
#     para "Hello World"
#   end

end
