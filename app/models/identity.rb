class Identity < OmniAuth::Identity::Models::ActiveRecord
  auth_key :name
  attr_accessible :name, :password, :password_confirmation
  validates_uniqueness_of :name
end
