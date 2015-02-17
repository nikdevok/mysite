class News < ActiveRecord::Base
  attr_accessible :body, :title

  validates :body, :presence => true
  validates :title, :presence => true

  #scope :order_by_created_at, order("created_at ASC")
end
