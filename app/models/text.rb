class Text < ActiveRecord::Base
  attr_accessible :content, :description, :title, :user_id
  belongs_to :user
  has_many :words
end

class PlainText < Text
  WORDS = Regexp.new '\p{Word}+'.encode('utf-8')
  after_save do
    content.scan(WORDS).each do |word|
      words.create content: word 
    end
  end
end

class Dictionary < Text
  after_save do
    dict = YAML.load content
    dict.each do |k,v|
      w = words.find_or_create_by_content k
      v.each{|one| w.translations.create content: one }      
    end
  end
end

