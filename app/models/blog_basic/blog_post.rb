module BlogBasic
  class BlogPost < ActiveRecord::Base

    #include BlogBasic::BlogBasicModelHelper
    include ActionView::Helpers::TextHelper

    unloadable

    attr_accessible :title, :body, :tag_list, :published

    #belongs_to :user

    has_many :blog_comments, :dependent => :destroy
    has_many :blog_images, :dependent => :destroy
    has_many :blog_contents

    accepts_nested_attributes_for :blog_images, :allow_destroy => true	

    validates_presence_of :title
    validates_presence_of :body

    default_scope :order => 'published_at DESC'

    scope :published, { :conditions => {:published => 1 }}
    scope :drafts, { :conditions => {:published => 0 }}

    before_save :check_published, :if => :not_resaving?
    after_save :replace_blog_image_tags, :if => :not_resaving?

    acts_as_taggable

    def markdown(text, markdown_options = {})
      BlueCloth.new(text, markdown_options).to_html
    end

    def code_highlight(text)
      text.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do
        CodeRay.scan($3, $2).div(:css => :class)
      end
    end

    def render_text(text, markdown_options = {})
      markdown(code_highlight(text), markdown_options)
    end

    def not_resaving?
      !@resaving
    end

    # For images that haven't been uploaded yet, they get a random image id
    # with 'upload' infront of it.  We replace those with their new image
    # id
    def replace_blog_image_tags
      @resaving = true
      self.body.gsub!(/[{]blog_image:upload[0-9]+:[a-zA-Z]+[}]/) do |image_tag|
        random_id, size = image_tag.scan(/upload([0-9]+)[:]([a-zA-Z]+)/).flatten

        new_id = random_id

        matching_image = self.blog_images.reject {|bi| !bi.random_id || bi.random_id != random_id }.first

        if matching_image
          new_id = matching_image.id
        end

        "{blog_image:#{new_id}:#{size}}"
      end

      self.save
      @resaving = false

      return true
    end

    def check_published
      if self.published_change && self.published_change == [false, true]
        # Moved to published state, update published_on
        self.published_at = Time.now
      end
    end

    #def show_user?
    #  (!BlogConf.data['show_user_who_published'] || BlogConf.data['show_user_who_published'] == true) && self.user
    #end


    def user_name(skip_link=false)
      return BlogConf.data['name']
      #if !skip_link && BlogConf.data['link_to_user']
      #  return "<a href=\"/users/#{self.user.id}\">#{CGI.escapeHTML(self.user.name)}</a>"
      #else
      #  return self.user.name
      #end
    end

    def parsed_body(length=0)
      image_parsed_body = self.body.gsub(/[{]blog_image[:]([0-9]+)[:]([a-zA-Z]+)[}]/) do |str|
        puts "IMAGE ID: #{$1.to_i}"
        img = BlogImage.find_by_id($1.to_i)
        logger.debug img.inspect.to_s
        if img
          img.image.url($2)
        else
          ''
        end
      end
      if length > 0
        image_parsed_body =  truncate(image_parsed_body, :length => length, :separator => ' ')
      end
      return render_text(image_parsed_body)
    end

    def formatted_updated_at
      self.updated_at.strftime(BlogConf.data['post_date_format'] || '%m/%d/%Y at %I:%M%p')
    end

    # Provide SEO Friendly URL's
    def to_param
      "#{id}-#{title.gsub(/[^a-z0-9]+/i, '-')}"
    end

    def user_image_tag
      if self.user && self.user.respond_to?(:blog_image_url) && self.user.blog_image_url
        # Load image from model
        ret = "<img src=\"#{self.user.blog_image_url}\" />"
      elsif BlogConf.data['gravatar']
        # Gravatar
        require 'digest/md5'
        if self.respond_to?(:email) && !self.email.blank?
          email = self.email
        elsif self.user && self.user.respond_to?(:email) && !self.user.email.blank?
          email = self.user.email
        else
          return ''
        end

        hash = Digest::MD5.hexdigest(email.downcase)
        ret = "<img src=\"http://www.gravatar.com/avatar/#{hash}.jpg\" />"
      else
        # No Image
        return ''
      end

      return ret.html_safe if ret.respond_to?(:html_safe)
      return ret
    end
  end
 end
