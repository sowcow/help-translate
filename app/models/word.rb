class Word < ActiveRecord::Base
  attr_accessible :content, :text_id
  belongs_to :text
  has_many :translations
  validates_uniqueness_of :content, scope: :text_id
end
