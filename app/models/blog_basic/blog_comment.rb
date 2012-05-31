module BlogBasic
  class BlogComment < ActiveRecord::Base
    #include BlogBasic::BlogBasicModelHelper

    unloadable

    belongs_to :user
    belongs_to :blog_article

    validates_presence_of :body
    validates :site_url, :url => true, :if => Proc.new{ |comment| !comment.site.blank? }

    before_save :check_for_spam

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

    def validate
      if !self.user
        self.errors.add(:name, 'is required') if self.name.blank?
      end
    end

    def formatted_created_at
      self.created_at.strftime(BlogBasic::BlogConf.data['post_date_format'] || '%m/%d/%Y at %I:%M%p')
    end

    def parsed_body
      # # Going to add markdown/html support later for comments
      # self.code_highlight_and_markdown(self.body, {:escape_html => true})

      self.body
    end

    def user_name
      name = self.user ? self.user.name : self.name
      if !self.site_url.blank? && false
        return "<a href=\"".html_safe << self.site_url << "\">".html_safe << name << "</a>".html_safe
      else
        return name
      end
    end

    def site
      self.site_url.blank? ? "" : self.site_url
    end

    # Used to set more tracking for akismet
    def request=(request)
      self.user_ip    = request.remote_ip
      self.user_agent = request.env['HTTP_USER_AGENT']
      self.referrer   = request.env['HTTP_REFERER']
    end

    def check_for_spam
      if BlogBasic::BlogConf.data['akismet_key'] && BlogBasic::BlogConf.data['blog_url']
        if Akismetor.spam?(akismet_attributes)
          self.errors.add_to_base('This comment has been detected as spam')
          return false
        else
          return true
        end
      end
      true
    end

    def akismet_attributes
      {
        :key                  => BlogBasic::BlogConf.data['akismet_key'],
        :blog                 => BlogBasic::BlogConf.data['blog_url'],
        :user_ip              => user_ip,
        :user_agent           => user_agent,
        :comment_author       => name,
        :comment_author_email => email,
        :comment_author_url   => site_url,
        :comment_content      => body
      }
    end

  end
end
