module BlogBasic
  class User < ActiveRecord::Base

    attr_accessible :identifier_url

    def self.create_with_omniauth(auth)
      create! do |user|
        user.provider = auth["provider"]
        user.uid = auth["uid"]
        user.name = auth["user_info"]["name"]
      end
    end

    def admin?
      !self.identifier_url.nil?
    end

    def name
      "Arvid Bottiger"
    end

  end
end
