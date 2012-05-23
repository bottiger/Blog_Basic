###require 'activeadmin'

module BlogBasic
  require 'blog_basic/engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
  require 'blog_basic/blog_basic_model_helper'
  require 'blog_basic/blog_conf'
  #BlogConf.new
  require 'akismetor'
  require 'url_validator'
  require 'acts-as-taggable-on'
  require 'will_paginate'
  require 'paperclip'
  #  require 'activeadmin'
  #module BlogBasic

end
