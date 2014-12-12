class ApplicationController < ActionController::Base
  layout :layout_by_resource
  # before_action :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


    protected

  def layout_by_resource
    if devise_controller? && resource_name == :password && action_name == "edit"
      "dashboard"
    else
      "application"
    end
  end

end
