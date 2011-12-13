module BlogBasic
  class SessionsController < ApplicationController
    skip_before_filter :verify_authenticity_token

    def new
    end

    def create
      auth = request.env["omniauth.auth"]
      logger.debug "Auth:" + auth.inspect
      user = User.where(:identifier_url => auth["uid"].to_s).first
      logger.debug "newlinedddd"
      logger.debug "Here, uid:" + auth["uid"].to_s + ", email:" + auth["info"].inspect
      user ||= User.create!(:identifier_url => auth["uid"].to_s)
      logger.debug "userid" + user.id.to_s
      #user ||= User.create!(:identifier_url => auth["uid"],
      #                      :email => auth["info"]["email"],
      #                      :first_name => auth["info"]["first_name"],
      #                      :last_name => auth["info"]["last_name"])
      #user = User.create_with_omniauth(auth)
      session[:user_id] = user.id
      logger.debug "before"
      redirect_to '/', :notice => "Signed in!"
      logger.debug "after"
    end

    def destroy
      session[:user_id] = nil
      redirect_to main_app.root_url, :notice => "Signed out!"
    end
  end
end
