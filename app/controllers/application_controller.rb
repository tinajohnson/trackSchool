class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # skip_before_action :require_no_authentication, :only => [ :new, :create, :cancel ]

  before_action :authenticate_user!

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:role])
  end

  def after_sign_in_path_for(resource)
    # Here you can write logic based on roles to return different after sign in paths
    # if current_user.role?(:admin)

    if current_user.role?(:rb)
        root_path
    elsif current_user.role?(:admin)
        sadmin_path
    end
  end


  def authenticate_admin_user!
    authenticate_user!
    unless current_user.role == 'rb'
      flash[:alert] = "This area is restricted to administrators only."
      # redirect_to '/admin/schools'
    end
  end

  def current_admin_user
    return nil if user_signed_in? && !current_user.admin?
    current_user
  end

  def school_admin
    render 'admin/index'
  end

end

