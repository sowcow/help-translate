Rails.application.config.middleware.use OmniAuth::Builder do
  provider :identity, fields: [:name] #, :uid_field => :name
end
