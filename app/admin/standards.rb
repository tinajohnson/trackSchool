ActiveAdmin.register Standard do
  permit_params :name
  def index
    if params[:school_id]
      standard_ids = ClassMapping.where(:school_id => params[:school_id]).pluck(:standard_id)
      @standards = Standard.where(:id => standard_ids)
    else
      @standards = Standard.all
    end
    render :json => @standards.collect {|standard| {:id => standard.id, :name => standard.name} }
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
