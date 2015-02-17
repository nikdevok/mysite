#encoding: utf-8

class Image < ActiveRecord::Base
	attr_accessible :img

  belongs_to :album
  has_attached_file :img, :styles => {:thumb => "150x120" },
                          :convert_options => {:thumb => "-gravity center -extent 150x120"}

  validates_attachment_content_type :img, :content_type=>/^image\/(gif|png|x\-png|jpeg|jpg|pjpeg)$/, message: "Вы не выбрали фотки"

  validates :img_file_name, :presence => true


end
