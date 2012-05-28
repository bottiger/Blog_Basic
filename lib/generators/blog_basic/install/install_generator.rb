module BlogBasic
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Installs Blog_Basic and generats the necessary migrations"

      #hook_for :users, :default => "devise", :desc => "Admin user generator to run. Skip with --skip-users"

      include Rails::Generators::Migration

      def self.source_root
        @_active_admin_source_root ||= File.expand_path("../templates", __FILE__)
      end  

      def self.next_migration_number(dirname)
        Time.now.strftime("%Y%m%d%H%M%S")
      end

      def copy_initializer
        template 'omniauth.rb.erb', 'config/initializers/blog_omniauth.rb'
      end

      #def setup_directory
      #  empty_directory "app/admin"
      #  template 'dashboards.rb', 'app/admin/dashboards.rb'
      #end

      def setup_routes
        route "mount BlogBasic::Engine => \"/blog\""
        route "match '/signin' => redirect('/auth/google')"
        route "match '/auth/:provider/callback', to: 'blog_basic/sessions#create'"
        route "match '/signout' => 'blog_basic/sessions#destroy', :as => :signout"
      end

      def create_assets
        #generate "active_admin:assets"
        copy_file "blog_kit.css", "public/stylesheets/blog_kit.css"
      end

      def copy_config
        copy_file "blog_basic.yml", "config/blog_basic.yml"
      end

      def load_dependencies
#        application "require 'rack/openid'"
      end

      def create_migrations
        Dir["#{self.class.source_root}/migrations/*.rb"].sort.each do |filepath|
          name = File.basename(filepath)
          migration_template "migrations/#{name}", "db/migrate/#{name.gsub(/^\d+_/,'')}"
          sleep 1
        end
      end
    end
  end
end
