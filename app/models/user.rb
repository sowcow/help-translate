class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid
  has_many :translations
  has_many :documents

  def self.find_or_create_from_auth_hash auth
    find_by_provider_and_uid(auth['provider'], auth['uid']) || create_with_omniauth(auth)
  end
  def self.create_with_omniauth auth
    create! do |user|
      user.uid = auth['uid']
      user.name = auth['info']['name']
      user.provider = auth['provider']
    end
  end
end
