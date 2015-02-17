# coding:utf-8

class Feedback < ActiveRecord::Base
  attr_accessible :email, :fio, :group_number, :message

  validates :fio, :length => {:maximum => 100 }
  validates :message, :presence => true, :length => { :maximum => 1000 }
  validates :email, :uniqueness => true,
                    :format     => { :with => Authentication.email_regex, :message => "Неверный формат электронной почты" }
  
end
