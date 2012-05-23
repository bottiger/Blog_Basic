module BlogBasic
  class Engine < Rails::Engine
    isolate_namespace BlogBasic

#    initializer 'setup active_admin' do |app|
#      ActiveAdmin.setup do |config|
#        config.site_title = "Blog Basics Administration panel"
#        config.authentication_method = :signed_in?
#        config.current_user_method = :current_user
#      end
#    end
  end
end
