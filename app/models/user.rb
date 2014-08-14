class User
  include Mongoid::Document
  field :provider, type: String
  field :uid, type: String
  field :name, type: String
  field :created_at, type: String

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        user.name = auth['info']['name'] || ""
        user.created_at = auth['info']['created_at'] || ""
      end
    end
  end

end

# Used http://www.ultrasaurus.com/2013/10/rails-4-twitter-omniauth-with-mongodb/ as well as their references as a guide
