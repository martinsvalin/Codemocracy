# encoding: UTF-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'

  before_filter :set_locale
  
  helper_method :current_user_session, :current_user

  private
    def set_locale
      I18n.locale = params[:lang]
    end

    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end

    def require_user
      unless current_user
        store_location
        flash[:alert] = "Du måste vara inloggad för att nå #{session[:return_to]}"
        redirect_to login_url
        return false
      end
    end

    def require_no_user
      if current_user
        store_location
        flash[:alert] = "Du är redan inloggad. " + 
          help.link_to("Logga ut?", logout_path, :method => :delete)
        redirect_to root_url
        return false
      end
    end

    def store_location
      session[:return_to] = request.fullpath
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end

    def help
      Helper.instance
    end

    class Helper
      include Singleton
      include ActionView::Helpers::UrlHelper
    end
end
