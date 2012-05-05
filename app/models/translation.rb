class Translation < ActiveRecord::Base
  attr_accessible :body, :sentence_id
  belongs_to :sentence
  belongs_to :user
  default_scope :order => 'created_at desc'
  validates_uniqueness_of :body, :scope => :sentence_id
end
