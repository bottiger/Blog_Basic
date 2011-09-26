# BlogKit Setup - handles settings

# require 'tm_syntax_highlighting'
# require 'rubygems'
# require 'uv'
# 
# # takes about a second to this, if we don't do it now, then the first call to highlight will take a little longer
# Uv.init_syntaxes 
# 
# ActionView::Base.send(:include, TmSyntaxHighlighting::Helper)
# ActionController::Base.send(:extend, TmSyntaxHighlighting::Controller)

# require 'tm_syntax_highlighting'
module BlogBasic

  def self.included(base)
    base.extend BlogBasic
  end

  class BlogBasic
    include Singleton

    def initialize
      load_config
    end

    def load_config
      CONFIG_FILENAME = "blog_basic.yml"

      if defined?(Rails)
        rails_root = Rails.root
      elsif defined?(RAILS_ROOT)
        rails_root = RAILS_ROOT
      else
        puts "Unable to load rails"
        return
      end
      file_name = "#{rails_root}/config/" + CONFIG_FILENAME
      if File.exists?(file_name)
        begin
          @settings = YAML::load(File.open(file_name).read)
        rescue Exception => e
          puts CONFIG_FILENAME + "config file is invalid"
        end
      else
        puts 'No ' + CONFIG_FILENAME + ' config file'
      end
    end

    def settings
      @settings
    end

    def paperclip_support?
      BlogImage.respond_to?(:has_attached_file)
    end
  end


