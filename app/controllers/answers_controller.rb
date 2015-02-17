# coding:utf-8

class AnswersController < ApplicationController
  before_filter :authenticate_user!
  # POST /answers
  # POST /answers.json
  def create
    @comment = Comment.find(params[:comment_id])
    @answer = @comment.answers.new(params[:answer])
    
    @answer.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to comments_path }
        format.json { render json: @answer, status: :created, location: @answer }
      else
        format.html { redirect_to comments_path }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    authorize! :destroy, @answer
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to answers_url }
      format.json { head :no_content }
    end
  end
end
