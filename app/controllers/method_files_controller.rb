# coding:utf-8

class MethodFilesController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  # GET /method_files
  # GET /method_files.json
  def index
    @method_files = MethodFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @method_files }
    end
  end

  # GET /method_files/1
  # GET /method_files/1.json
  def show
    @method_file = MethodFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @method_file }
    end
  end

  # GET /method_files/new
  # GET /method_files/new.json
  def new
    @method_file = MethodFile.new
    authorize! :create, @method_file
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @method_file }
    end
  end

  # GET /method_files/1/edit
  def edit
    @method_file = MethodFile.find(params[:id])
    authorize! :update, @method_file
  end

  # POST /method_files
  # POST /method_files.json
  def create
    @method_file = MethodFile.new(params[:method_file])
    authorize! :create, @method_file
    respond_to do |format|
      if @method_file.save
        format.html { redirect_to @method_file, notice: 'Запись добавлена.' }
        format.json { render json: @method_file, status: :created, location: @method_file }
      else
        format.html { render action: "new" }
        format.json { render json: @method_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /method_files/1
  # PUT /method_files/1.json
  def update
    @method_file = MethodFile.find(params[:id])
    authorize! :update, @method_file
    respond_to do |format|
      if @method_file.update_attributes(params[:method_file])
        format.html { redirect_to @method_file, notice: 'Запись изменена.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @method_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /method_files/1
  # DELETE /method_files/1.json
  def destroy
    @method_file = MethodFile.find(params[:id])
    authorize! :destroy, @method_file
    @method_file.destroy

    respond_to do |format|
      format.html { redirect_to method_files_url }
      format.json { head :no_content }
    end
  end
end
