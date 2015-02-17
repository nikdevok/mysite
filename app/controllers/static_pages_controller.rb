#coding:utf-8

class StaticPagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:main_page, :about_me, :shedule_page]
  #load_and_authorize_resource
  # GET /static_pages
  # GET /static_pages.json
  
  def show
    @static_page = StaticPage.find(params[:id])
    authorize! :create, @static_page
  end

  def main_page
    @static_page = StaticPage.find_by_page_type("Главная страница")
    respond_to do |format|
      format.html { render "show" }
    end
  end

  def shedule_page
    @static_page = StaticPage.find_by_page_type("Расписание занятий")
    respond_to do |format|
      format.html { render "show" }
    end
  end

  def about_me
    @static_page = StaticPage.find_by_page_type("Обо мне")
    respond_to do |format|
      format.html { render "show" }
    end
  end

  # GET /static_pages/1/edit
  def edit
    @static_page = StaticPage.find(params[:id])
    authorize! :update, @static_page
  end

  # PUT /static_pages/1
  # PUT /static_pages/1.json
  def update
    @static_page = StaticPage.find(params[:id])
    authorize! :update, @static_page
    respond_to do |format|
      if @static_page.update_attributes(params[:static_page])
        format.html { redirect_to @static_page, notice: 'Страница успешно изменена.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @static_page.errors, status: :unprocessable_entity }
      end
    end
  end
=begin
  # GET /static_pages/new
  # GET /static_pages/new.json
  def new
    @static_page = StaticPage.new
    authorize! :create, @static_page
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @static_page }
    end
  end



  # POST /static_pages
  # POST /static_pages.json
  def create
    @static_page = StaticPage.new(params[:static_page])
    authorize! :create, @static_page
    respond_to do |format|
      if @static_page.save
        format.html { redirect_to @static_page, notice: 'Страница успешно создана.' }
        format.json { render json: @static_page, status: :created, location: @static_page }
      else
        format.html { render action: "new" }
        format.json { render json: @static_page.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /static_pages/1
  # DELETE /static_pages/1.json
  def destroy
    @static_page = StaticPage.find(params[:id])
    authorize! :destroy, @static_page
    @static_page.destroy

    respond_to do |format|
      format.html { redirect_to static_pages_url }
      format.json { head :no_content }
    end
  end
=end

end
