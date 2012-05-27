class Text < ActiveRecord::Base
  attr_accessible :content, :description, :title
  belongs_to :user
  has_many :texts_words
  has_many :words, :through => :texts_words

  WORDS = Regexp.new '\p{Word}+'.encode('utf-8')
  after_save do
    words.clear
    self[:content].scan(WORDS).each do |word|
      w = Word.get word #find_or_create_by_content word
      texts_words.find_or_create_by_word_id_and_text_id w.id, id
    end
  end
end
