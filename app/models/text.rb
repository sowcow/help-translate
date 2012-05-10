class Text < ActiveRecord::Base
  attr_accessible :content, :description, :title, :user_id
  belongs_to :user
end

class PlainText < Text
end

class Dictionary < Text
end

