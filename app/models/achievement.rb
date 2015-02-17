class Achievement < ActiveRecord::Base
  attr_accessible :description, :img

  has_attached_file :img, :styles => { :medium => "200x200", :thumb => "150x150" },
                    :convert_options => {:thumb => "-gravity center -extent 150x150"}

  validates_attachment_content_type :img, :content_type=>/^image\/(gif|png|x\-png|jpeg|jpg|pjpeg)$/
  validates :img, :description, :presence => true
end
