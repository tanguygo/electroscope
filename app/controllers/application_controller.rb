class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized(e=nil)
    puts e.to_yaml
    flash[:alert] = "Vous n'avez pas les droits requis pour accéder à cette page. Vérifiez que vous êtes connecté au bon compte !"
    redirect_to(request.referrer || root_path)
  end

end
