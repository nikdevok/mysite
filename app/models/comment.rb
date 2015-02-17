class Comment < ActiveRecord::Base
  belongs_to :user
  has_many :answers, dependent: :destroy 
  attr_accessible :body

  validates :body, :presence => true, :length => { :maximum => 5000 }

end
