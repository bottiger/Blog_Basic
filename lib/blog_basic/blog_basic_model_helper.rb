#module BlogBasic

require 'rubygems'

begin
  #require 'maruku'
  require 'bluecloth'
rescue Exception => e
  require 'erb'
  puts "Could not load bluecloth #{e.inspect}"
end
begin
  require 'coderay'
rescue Exception => e
  require 'erb'
  puts "Could not load coderay"
end

module BlogBasic

  module BlogBasicModelHelper

    def markdown(text, markdown_options = {})
      BlueCloth.new(text, markdown_options).to_html
    end

    def code_highlight(text)
      text.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do
        CodeRay.scan($3, $2).div(:css => :class)
      end
    end

#    def render_text(text, markdown_options = {})
#      markdown(code_highlight(text), markdown_options)
#    end

    def code_highlight_and_markdown(text, markdown_options = {})
      render_text(text, markdown_options)
      if false
        text_pieces = text.split(/(<code>|<code lang="[A-Za-z0-9_-]+">|
                                   <code lang='[A-Za-z0-9_-]+'>|<\/code>)/)
        in_pre = false
        language = nil
        post = text_pieces.collect do |piece|
          if piece =~ /^<code( lang=(["'])?(.*)\2)?>$/
            language = $3
            in_pre = true
            nil
          elsif piece == "</code>"
            in_pre = false
            language = nil
            nil
          elsif in_pre
            lang = language ? language : "ruby"
            if defined?(Uv)
              "<div class=\"blogKitCode\">" + Uv.parse( piece.strip, "xhtml", lang, BlogConf.data['show_line_numbers'] || false, BlogConf.data['theme'] || 'mac_classic') + "</div>"
            else
              "<code>#{ERB::Util.html_escape(piece)}</code>"
            end
          else
            if defined?(BlueCloth)
              markdown(piece)
              #BlueCloth.new(piece, markdown_options).to_html
              ##Maruku.new(piece).to_html
            else
              ERB::Util.html_escape(piece)
            end
          end
        end.join('')

        return post.html_safe if post.respond_to?(:html_safe)
        return post
      end
    end

    def user_image_tag2
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
