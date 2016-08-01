ActiveAdmin.register User  do
    permit_params :email , :role
    remove_filter :encrypted_password,:reset_password_token, :reset_password_sent_at,
    :remember_created_at,
    :sign_in_count,
    :current_sign_in_at,
    :last_sign_in_at,
    :current_sign_in_ip,
    :last_sign_in_ip,
    :created_at,
    :updated_at


      index do
         selectable_column
         column :id
         column :email
         column :role

         actions
      end

    action_item :view, only: :show do
      link_to 'View on site', manage_teachers_path
    end
    
     batch_action :Add_as_teacher, form: {
    } do |ids|
      # inputs is a hash of all the form fields you requested
      redirect_to add_as_teacher_path params: {id: ids}
    end


    form do |f|
      f.inputs "Label" do
        f.input :email
        f.input :school_id, :as => :select, :collection => School.all.collect { |school| [school.school_name, school.id] }
        f.input :role , as: :select, collection: ['Teacher','Admin','RB User']

      end
    end



  end
