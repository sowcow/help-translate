class Word < ActiveRecord::Base
  attr_accessible :content
  has_many :translations
  has_many :tests_words
  has_many :texts, :through => :texts_words
  validate :not_a_number

  def similars count=3
    Word.select("*, content <-> text('#{content}') AS dist").where("id <> #{id}").order('dist').limit(count)
    #Word.select("DISTINCT content, content <-> text('#{content}') AS dist").where("id <> #{id}").order('dist').limit(count)
    #Word.select("DISTINCT content, similarity(text(content), text('#{content}')) as sim").where("id <> #{id}").order('sim').limit(count)
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
