class Translation < ActiveRecord::Base
  attr_accessible :content #, :translator_id, :word_id
  belongs_to :word
  belongs_to :translator, polymorphic: true  
end
