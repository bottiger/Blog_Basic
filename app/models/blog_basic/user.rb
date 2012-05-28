module BlogBasic
  class User < ActiveRecord::Base

    attr_accessible :identifier_url
    before_save :default_values
  

    def default_values
        self.status ||= BlogBasic::BlogConf.data['name']
    end

    ## To be deleted
    #def self.create_with_omniauth(auth)
    #  create! do |user|
    #    user.provider = auth["provider"]
    #    user.uid = auth["uid"]
    #    user.name = auth["user_info"]["name"]
    #  end
    #end

    #def admin?
    #  !self.identifier_url.nil?
    #end

    def name
      self.name
    end

  end
end
