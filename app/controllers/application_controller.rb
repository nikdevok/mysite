#coding:utf-8

# TODO !
=begin
  /Фотогалерея - чекбоксы на удаление, чекбокс выделить всё
  Стиль - поиграться с тенями
  Методическая копилка, Новости, Достижения - поменять стиль
  Гостевая книга - стиль комментария
  Сделать возможность переключать между шаблонами (fizruk и zvezdochka)
=end


class ApplicationController < ActionController::Base
 	protect_from_forgery
  before_filter :authenticate_user!

  #include SimpleCaptcha::ControllerHelpers

  #layout "application_fizruk544dou"
  layout "application_dou_star"



  if Rails.env == "production"
    # rescue_from CanCan::AccessDenied do |exception|
    #   redirect_to root_url
    # end
    #
    # rescue_from ActionController::RoutingError do |ex|
    #   redirect_to root_url, notice: "Страница не найдена"
    # end
    #
    # rescue_from StandardError do |ex|
    #   redirect_to root_url, notice: "Страница не найдена"
    # end
  end




end
