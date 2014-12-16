class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # gem used for dealing with autorizations
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # local exceptions (at development stage) are not intercepted, so as to correct bugs with the debugger
  unless Rails.application.config.consider_all_requests_local
   rescue_from Exception, with: :handle_exception
  end

  private

  def user_not_authorized(e=nil)
    flash[:alert] = "Vous n'avez pas les droits requis pour accéder à cette page. Vérifiez que vous êtes connecté au bon compte !"
    redirect_to(request.referrer || root_path)
  end
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def handle_exception(exception=nil)
    if exception
      if [ActionController::RoutingError, ActionController::UnknownController, AbstractController::ActionNotFound].include?(exception.class)
        return render_404
      else
        logger = Logger.new(STDOUT)
        logger.debug "Exception Message: #{exception.message} \n"
        logger.debug "Exception Class: #{exception.class} \n"
        logger.debug "Exception Backtrace: \n"
        logger.debug exception.backtrace.join("\n")
        # DevMailer.exception(exception, request.original_url, request.fullpath, current_copasser)
        return render_500
      end
    end
  end

  def render_404
    respond_to do |format|
      format.html { render template: 'errors/not_found', layout: 'layouts/application', status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end

  def render_500
    respond_to do |format|
      format.html { render template: 'errors/internal_server_error', layout: 'layouts/application', status: 500 }
      format.all { render nothing: true, status: 500}
    end
  end


end
