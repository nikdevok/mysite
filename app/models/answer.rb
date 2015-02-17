class Answer < ActiveRecord::Base
  belongs_to :comment 
  belongs_to :user
  attr_accessible :body, :comment_id

  validates :body, :presence => true, :length => { :maximum => 5000 }
  validates :comment_id, :presence => true
end
