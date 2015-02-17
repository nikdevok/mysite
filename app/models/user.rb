#encoding:utf-8

class User < ActiveRecord::Base
  apply_simple_captcha
  before_create :assign_user_ability
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :avatar

  has_attached_file :avatar, :styles => {:thumb => "64x64" },
                    :convert_options => {:thumb => "-gravity center -extent 64x64"}

  validates_attachment_content_type :avatar, :content_type=>/^image\/(gif|png|x\-png|jpeg|jpg|pjpeg)$/, message: "Вы не выбрали фотку"

  #validates :avatar_file_name, :presence => true


  has_many :comments, :dependent => :destroy
  has_many :answers

  attr_accessible :login, :email, :password, :password_confirmation, :remember_me, :nickname

  attr_accessible :captcha, :captcha_key

  validates :nickname, :presence => true, :uniqueness => true
  validates :login, :presence => true, :uniqueness => true


  validates_length_of :password, within: 4..100, allow_blank: true

  # validates_presence_of :password, :password_confirmation


  
  scope :with_role, lambda { |role| {:conditions => "roles_mask & #{2**ROLES.index(role.to_s)} > 0"} }
  
  ROLES = %w[admin user]
  
  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end
  
  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end
  
  def role?(role)
    roles.include? role.to_s
  end

  def is_admin?
    roles.include? "admin"
  end

  def self.assign_admin_ability user
    user.roles << Role.find_by_name(:admin)
  end

  private

  def assign_user_ability
  	self.roles << Role.find_by_name(:user)
  end


  def email_required?
    false
  end



end
