ActiveAdmin.register Student do
  permit_params :standard_id, :section_id, :school_id, :name
  index do
    ClassMapping.column_names.each do |c|
      column c.to_sym
    end
    actions
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
