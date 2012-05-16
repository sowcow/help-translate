class TextsWord < ActiveRecord::Base
  belongs_to :text
  belongs_to :word
  #validates_uniqueness_of :word_id, :scope => :text_id
end
