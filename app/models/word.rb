class Word < ActiveRecord::Base
  attr_accessible :content
  has_many :translations
  has_many :tests_words
  has_many :texts, :through => :texts_words
  validate :not_a_number
  scope :has_translations, :conditions => "words.id IN (SELECT word_id FROM translations)"

  def self.get word
    Word.find_or_create_by_content word.downcase
  end
  
  def similars count=3
    Word.has_translations.select("*, content <-> text('#{content}') AS dist").where("id <> #{id}").order('dist').limit(count)
    #Word.select("DISTINCT content, content <-> text('#{content}') AS dist").where("id <> #{id}").order('dist').limit(count)
    #Word.select("DISTINCT content,similarity(text(content), text('#{content}')) as sim").where("id <> #{id}").order('sim').limit(count)
  end
  alias_method :similar, :similars
  before_save do |word|
    word.content = word.content.downcase
  end

  private
  def not_a_number
    errors.add(:content, 'can''t be a number') if content =~ /^[-.,0-9]+$/
  end
end
