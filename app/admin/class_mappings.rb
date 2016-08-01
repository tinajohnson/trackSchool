ActiveAdmin.register ClassMapping do

  permit_params :standard_id, :section_id, :school_id
  index do
    selectable_column
    column :id
    column "Standard" do |i|
      i.standard.name
    end
    column "Section" do |i|
      i.section.name
    end
    column "School" do |i|
      i.school.name
    end
    actions
  end

  # controller do
  #   def create
  #     @class_mapping = ClassMapping.new(class_mapping_params)
  #     if @class_mapping.save
  #       redirect_to action: :show, id: @class_mapping.id
  #     else
  #       render 'new'
  #     end
  #   end
  #
  #   def class_mapping_params
  #     params.require(:class_mapping).permit(:standard_id, :section_id, :school_id)
  #   end
  # end

  form do |f|
    f.inputs "Class Details" do
      f.input :standard_id, :as => :select, :collection => Standard.all.collect { |standard| [standard.name, standard.id] }
      f.input :section_id, :as => :select, :collection => Section.all.collect { |section| [section.name, section.id] }
      f.input :school_id, :as => :select, :collection => School.all.collect { |school| [school.name, school.id] }
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
