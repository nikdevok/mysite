class News < ActiveRecord::Base
  attr_accessible :body, :title

  validates_presence_of :body, :title
  validates_uniqueness_of :title
end
