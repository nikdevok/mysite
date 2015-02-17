#coding:utf-8

class CommentsController < ApplicationController
  before_filter :authenticate_user!

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.includes(:answers)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])
    
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to comments_path, notice: 'Коментарий успешно добавлен!' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { redirect_to comments_path }
        #format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])
    authorize! :update, @comment
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to comments_path, notice: 'Комментарий успешно обновлен!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    authorize! :destroy, @comment
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end
end
