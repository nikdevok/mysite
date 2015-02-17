#coding:utf-8

class RegistrationsController < Devise::RegistrationsController
  #skip_before_filter :require_no_authentication, :only => [:new]
  before_filter :configure_permitted_parameters, :if => :devise_controller?


  def create
    if captcha_valid?
      super
    else
      build_resource
      resource.save if resource
      resource.errors.add(:base, "Пожалуйста введите код проверки еще раз") if resource
      render :new
    end

  end

  private

  def captcha_valid?
    @user = User.new(params[:user])
    @captcha = Captcha.find_by_key(@user.captcha_key)
    @user.captcha == @captcha.value
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:login, :email, :password, :password_confirmation, :avatar, :current_password) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:login, :email, :password, :password_confirmation, :avatar, :current_password) }
  end

end