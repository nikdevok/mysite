#encoding: utf-8

class Admin::UsersController < ApplicationController
  respond_to :html

  load_and_authorize_resource

  def index
  end

  def new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    flash[:notice] = "Пользователь зарегистрирован" if @user.save
    respond_with(:admin, @user, location: admin_users_path)
  end

  def update
    flash[:notice] = "Данные пользователя изменены" if @user.update(user_params)
    respond_with(:admin, @user, location: admin_users_path)
  end

  def destroy
    flash[:notice] = "Пользователь удален" if @user.destroy
    respond_with(:admin, @user)
  end

  private

  def user_params
    params.require(:user).permit(:login, :nickname, :email, :password, :password_confirmation)
  end
end
