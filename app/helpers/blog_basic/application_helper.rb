module BlogBasic
  module ApplicationHelper
    def signed_in?
      logger.debug "(helper) Logged in: " + session[:user_id].to_s + " == " +  BlogBasic::BlogConf.data['identity'].to_s
      session[:user_id] == BlogBasic::BlogConf.data['identity']
    end

    def current_user
      logger.info "Current user ID: " + session[:user_id].to_s 
      if signed_in?
        session[:user_id]
      end
    end

    def ensure_signed_in
      unless signed_in?
        session[:redirect_to] = request.request_uri
        redirect_to(new_session_path)
      end
    end
  end
end
