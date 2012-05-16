class Text < ActiveRecord::Base
  attr_accessible :content, :description, :title
  belongs_to :user
  #has_many :words, :dependent => :nullify
  has_and_belongs_to_many :words

  WORDS = Regexp.new '\p{Word}+'.encode('utf-8')
  after_save do
    #words.delete_all
    words.clear
    self[:content].scan(WORDS).each do |word|
      words << Word.find_or_create_by_content(word)
      #words.create content: word #if Word.where(content: word).count == 0
    end
  end
end

#class PlainText < Text
#  WORDS = Regexp.new '\p{Word}+'.encode('utf-8')
#  after_save do
#    words.delete_all
#    self[:content].scan(WORDS).each do |word|
#      #words << Word.find_or_create_by_content word 
#      words.create content: word if Word.where(content: word).count == 0
#    end
#  end
#end
#
#class Dictionary < Text
#  after_initialize :default_values
#  after_save :use_translations
#
#  private
#  def default_values
#    self.content ||= "---\nword1: translation\nword2:\n"+
#                     "- translation\n- another translation"
#  end
#  def use_translations
#    dict = YAML.load content
#    dict.each do |k,v|
#      w = words.find_or_create_by_content k
#      [v].flatten.each{|one| w.translations.create content: one }      
#    end
#  end
#end

