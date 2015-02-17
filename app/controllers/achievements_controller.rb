# coding:utf-8

class AchievementsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  before_filter :set_achievement, :only => [:show, :edit, :update, :destroy]
  
  
  def index
    @achievements = Achievement.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @achievements }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @achievement }
    end
  end


  def new
    @achievement = Achievement.new
    authorize! :create, @achievement
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @achievement }
    end
  end

  def edit
    authorize! :update, @achievement
  end

  def create
    @achievement = Achievement.new(params[:achievement])
    authorize! :create, @achievement
    respond_to do |format|
      if @achievement.save
        format.html { redirect_to @achievement, notice: 'Достижение добавлено.' }
        format.json { render json: @achievement, status: :created, location: @achievement }
      else
        format.html { render action: "new" }
        format.json { render json: @achievement.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize! :update, @achievement
    respond_to do |format|
      if @achievement.update_attributes(params[:achievement])
        format.html { redirect_to @achievement, notice: 'Достижение изменено.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @achievement.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize! :destroy, @achievement
    @achievement.destroy

    respond_to do |format|
      format.html { redirect_to achievements_url }
      format.json { head :no_content }
    end
  end

  private

  def set_achievement
    @achievement = Achievement.find(params[:id])
  end
end
