#encoding: utf-8

class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_user, only: [:edit, :update, :destroy]

  load_and_authorize_resource

  def index
    authorize! :read, User
  end

  def new
    authorize! :create, User
    @user = User.new
  end

  def edit
  end

  def create
    authorize! :create, User
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: "Пользователь зарегистрирован"
    else
      render :new
    end
  end

  def update
    authorize! :update, @user
    if @user.update_attributes(user_params)
      redirect_to admin_users_path, notice: "Данные пользователя изменены"
    else
      render :new
    end
  end

  def destroy
    authorize! :destroy, @user
    @user.destroy
    redirect_to admin_users_path, notice: "Пользователь удален"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:login, :nickname, :email, :password, :password_confirmation)
  end
end
