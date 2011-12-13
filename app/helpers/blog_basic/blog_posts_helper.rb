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
      "<link rel=\"canonical\" href=\"/".html_safe + post.id.to_s + "\" />".html_safe
    end

  end
end
