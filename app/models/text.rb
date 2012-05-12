class Text < ActiveRecord::Base
  attr_accessible :content, :description, :title #, :user_id
  belongs_to :user
  has_many :words
end

class PlainText < Text
  WORDS = Regexp.new '\p{Word}+'.encode('utf-8')
  after_save do
    self[:content].scan(WORDS).each do |word|
      words.create content: word 
    end
  end
end

class Dictionary < Text
  after_initialize :default_values
  after_save :use_translations

  private
  def default_values
    self.content ||= "---\nword1: translation\nword2:\n"+
                     "- translation\n- another translation"
  end
  def use_translations
    dict = YAML.load content
    dict.each do |k,v|
      w = words.find_or_create_by_content k
      [v].flatten.each{|one| w.translations.create content: one }      
    end
  end
end

