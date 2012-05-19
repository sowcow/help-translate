class Translation < ActiveRecord::Base
  attr_accessible :content, :word_id #, :translator_id, :word_id
  belongs_to :word
  belongs_to :translator, polymorphic: true  
  validates_uniqueness_of :content, :scope => :word_id
end
