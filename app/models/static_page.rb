class StaticPage < ActiveRecord::Base
  validates_presence_of :title, :menu_title, :body, :page_type
  validates_uniqueness_of :page_type, :title, :menu_title

  def to_param
    page_type
  end
end
