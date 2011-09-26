module BlogBasic
  require 'blog_basic/engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
  require 'blog_basic/blog_basic_model_helper'
  require 'blog_basic/blog_conf'
  #BlogConf.new
end
