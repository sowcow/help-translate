class Translation < ActiveRecord::Base
  attr_accessible :content, :word_id
  belongs_to :word
  belongs_to :user
  default_scope :order => 'created_at desc'
  validates_uniqueness_of :content, :scope => :word_id
end
