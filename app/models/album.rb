
class Album < ActiveRecord::Base


  attr_accessible :cover, :title
  has_attached_file :cover, :styles => {:thumb => "70x70", :medium => "200x200" },
    :convert_options => {:thumb => "-gravity center -extent 70x70"}
  has_many :images, :dependent => :destroy
  

  validates_attachment_content_type :cover, :content_type=>/^image\/(gif|png|x\-png|jpeg|jpg|pjpeg)$/
  validates :cover, :title, :presence => true  
  
end
