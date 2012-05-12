class Word < ActiveRecord::Base
  attr_accessible :content, :text_id
  belongs_to :text
  has_many :translations
  validates_uniqueness_of :content, scope: :text_id
  def similars count=3
    Word.select("*, content <-> text('#{content}') AS dist").where("id <> #{id}").order('dist').limit(count)
    #Word.select("DISTINCT content, content <-> text('#{content}') AS dist").where("id <> #{id}").order('dist').limit(count)
    #Word.select("DISTINCT content, similarity(text(content), text('#{content}')) as sim").where("id <> #{id}").order('sim').limit(count)
  end
  alias_method :similar, :similars
  before_save do |word|
    word.content = word.content.downcase  # if content
  end
end
