class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password)
    end
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :email, :password)
    end
    devise_parameter_sanitizer.for(:sign_in) do |u|
      u.permit(:email, :password)
    end
  end

  def after_sign_in_path_for(resource)
    root_url
  end

  def after_sign_up_path_for(resource)
    root_url
  end

  after_action :verify_authorized, :except => :index
  after_action :verify_policy_scoped, :only => :index

    # Globally rescue Authorization Errors in controller.
  # Returning 403 Forbidden if permission is denied
  rescue_from Pundit::NotAuthorizedError, with: :permission_denied

  private

  def permission_denied
    flash[:alert] = "You are not authorized to perform this action."
    return redirect_to root_path
  end
end
