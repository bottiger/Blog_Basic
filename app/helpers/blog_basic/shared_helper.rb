module BlogBasic
  module SharedHelper

    def require_user
      #return true
      logger.info session[:user_id].to_s
      @current_user ||= User.new(session[:user_id])
    end

    def title(page_title)
      content_for(:title, page_title)
    end

    def sidebar_ad(posted_at)
      if (posted_at < 30.days.ago) && !danish?
        raw render(:partial => '/snippets/v_text_ad')
      end
    end

    def leaderboard_ad
      if !danish?
        raw render(:partial => '/snippets/h_leaderboard_ad')
      else
        raw render :text => "<div></div>"
      end
    end

    private

    def danish?
      #geoip ||= GeoIP.new("#{RAILS_ROOT}/db/GeoIP.dat")
      #return geoip.country(request.ip).country_code2 == "DK"
    end

  end
end
