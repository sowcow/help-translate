class Dictionary < ActiveRecord::Base
  attr_accessible :content, :descriptin, :title
  belongs_to :user
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
