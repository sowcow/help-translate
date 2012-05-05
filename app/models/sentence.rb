class Sentence < ActiveRecord::Base
  attr_accessible :additional, :body
  belongs_to :document
  has_many :translations
  self.per_page = 20
end
