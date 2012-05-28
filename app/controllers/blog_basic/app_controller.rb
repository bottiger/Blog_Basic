module BlogBasic
  class AppController < ActionController::Base
    protect_from_forgery
    helper :all

    def require_user
      session[:user_id]
    end

    def signed_in?
      session[:user_id] == BlogBasic::BlogConf.data['identity']
    end

    def current_user
      logger.info "Current user ID: " + session[:user_id].to_s
      if signed_in?
        session[:user_id]
      end
    end
  end
end
