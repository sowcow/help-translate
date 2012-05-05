class Document < ActiveRecord::Base
  attr_accessible :description, :title
  belongs_to :user
  has_many :sentences
  validates_presence_of :title
end
