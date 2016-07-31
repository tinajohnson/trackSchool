ActiveAdmin.register Allotment do

  remove_filter :created_at,
                :updated_at

  index do
    selectable_column
    column :id
    column "Name" do |i|
      User.find(i.user_id).email
    end
    column "Standard" do |i|
     if(i.role == "Teacher")
      std = ClassMapping.find(i.class_mappings_id).standard_id
      Standard.find(std).standard_name
     end
    end
    column "Section" do |i|
      if(i.role == "Teacher")
        sec = ClassMapping.find(i.class_mappings_id).section_id
        Section.find(sec).section_name
      end
    end
    column :role
    actions
  end

  form do |f|
    f.inputs "Allotment" do
      f.input :user_id, :as => :select, :collection => User.all.collect { |user| [user.email, user.id] }
      f.input :role , as: :select, collection: ['Teacher','Admin','RB User']
      f.input :class_mappings_id, :as => :select, :collection => ClassMapping.all.collect { |class_m| [Section.find(class_m.section_id).section_name,class_m.id] }

    end
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
