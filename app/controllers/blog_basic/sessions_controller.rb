module BlogBasic
  class SessionsController < ApplicationController
    skip_before_filter :verify_authenticity_token

    def new
    end

    def create
      auth = request.env["omniauth.auth"]
      #user ||= User.create!(:identifier_url => auth["uid"],
      #                      :email => auth["info"]["email"],
      #                      :first_name => auth["info"]["first_name"],
      #                      :last_name => auth["info"]["last_name"])
      #user = User.create_with_omniauth(auth)
      session[:user_id] = auth["info"]["email"]
      redirect_to '/', :notice => "Signed in!"
    end

    def destroy
      session[:user_id] = nil
      redirect_to main_app.root_url, :notice => "Signed out!"
    end
  end
end
