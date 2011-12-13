module BlogBasic
  class BlogConf                                                        
    #include Singleton                                                             

    #def initialize                                                                
    def self.data
    #@data = YAML.load_file("#{rails_root}/config/" + "blog_basic.yml")                                        
      config_filename = "blog_basic.yml"

      if defined?(Rails)
        rails_root = Rails.root
      elsif defined?(RAILS_ROOT)
        rails_root = RAILS_ROOT
      else
        puts "Unable to load rails"
        return
      end
      file_name = "#{rails_root}/config/" + config_filename
      if File.exists?(file_name)
        begin
          @settings = YAML::load(File.open(file_name).read)
        rescue Exception => e
          puts config_filename + "config file is invalid"
        end
      else
        puts 'No ' + config_filename + ' config file'
      end
      #file_name
      @settings
    end 

    #def self.data
    #  @settings
    #end
  end
end
