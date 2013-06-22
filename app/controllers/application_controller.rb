class ApplicationController < ActionController::Base
  protect_from_forgery

helper_method :redirect_back_or
helper_method :store_location
private
   def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end
end
