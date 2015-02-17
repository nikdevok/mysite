class MethodFile < ActiveRecord::Base
  attr_accessible :descriprion, :doc

  has_attached_file :doc

  validates_attachment_content_type :doc, :content_type=>/^*$/#/^image\/(gif|png|x\-png|jpeg|jpg|pjpeg)$/
  validates :descriprion, :presence => true
end
