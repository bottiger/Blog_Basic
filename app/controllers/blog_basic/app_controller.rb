module BlogBasic
  class AppController < ActionController::Base
    protect_from_forgery
    helper :all

    def require_user
      User.new
    end

    def signed_in?
      !session[:user_id].nil?
    end

    def current_user
      logger.info "Current user ID: " + session[:user_id].to_s
      if signed_in?
        @current_user ||= User.find(session[:user_id])
      end
    end

    #    def current_user
    #      logger.info "(from app_controller.rb) Current user ID: " + session[:user_id].to_s
    #      return session[:user_id].nil? ? User.new : User.find(session[:user_id])
    #    end

  end
end
