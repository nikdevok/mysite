#coding:utf-8

class StaticPagesController < ApplicationController


  load_and_authorize_resource find_by: :page_type

  respond_to :html

  def index
  end

  def show
  end

  def edit
  end

  def update
    @static_page.update(page_params)
    flash[:notice] = "Страница сохранена!" if @static_page.save
    respond_with(@static_page)
  end

  private

  def page_params
    params.require(:static_page).permit(:title, :menu_title, :body, :page_type)
  end

end
