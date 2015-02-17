#coding: utf-8

class ConsultationsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  # GET /consultations
  # GET /consultations.json
  def index
    @consultations = Consultation.order("created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @consultations }
    end
  end

  # GET /consultations/1
  # GET /consultations/1.json
  def show
    @consultation = Consultation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @consultation }
    end
  end

  # GET /consultations/new
  # GET /consultations/new.json
  def new
    @consultation = Consultation.new
    authorize! :create, @consultation
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @consultation }
    end
  end

  # GET /consultations/1/edit
  def edit
    @consultation = Consultation.find(params[:id])
    authorize! :update, @consultation
  end

  # POST /consultations
  # POST /consultations.json
  def create
    @consultation = Consultation.new(params[:consultation])
    authorize! :create, @consultation
    respond_to do |format|
      if @consultation.save
        format.html { redirect_to @consultation, notice: 'Консультация успешно добавлена' }
        format.json { render json: @consultation, status: :created, location: @consultation }
      else
        format.html { render action: "new" }
        format.json { render json: @consultation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /consultations/1
  # PUT /consultations/1.json
  def update
    @consultation = Consultation.find(params[:id])
    authorize! :update, @consultation
    respond_to do |format|
      if @consultation.update_attributes(params[:consultation])
        format.html { redirect_to @consultation, notice: 'Консультация успешно изменена' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @consultation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consultations/1
  # DELETE /consultations/1.json
  def destroy
    @consultation = Consultation.find(params[:id])
    authorize! :destroy, @consultation
    @consultation.destroy

    respond_to do |format|
      format.html { redirect_to consultations_path }
      format.json { head :no_content }
    end
  end
end
