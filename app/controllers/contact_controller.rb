#coding: utf-8
class ContactController < ApplicationController
  before_filter :authenticate_user!
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    
    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      redirect_to(root_path, :notice => "Сообщение отправлено!")
    else
      flash.now.alert = "Пожалуйста заполните все поля!"
      render :new
    end
  end
end
