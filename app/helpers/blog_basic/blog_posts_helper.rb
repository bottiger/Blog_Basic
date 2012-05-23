module BlogBasic
  module BlogPostsHelper

    def display_name(name, site)
      if !site.blank?
        return link_to(name, site, :rel => 'nofollow')
      else
        return name
      end
    end

    def carnonical_link(post)
      prefix=""
      url_parts = blog_post_path.split("/") # FIXME: pretty solution is welcome
      url_parts.each { |part| prefix = prefix + part + "/" unless part == url_parts.last }
      "<link rel=\"canonical\" href=\"".html_safe + prefix + post.id.to_s + "\" />".html_safe
    end

  end
end
