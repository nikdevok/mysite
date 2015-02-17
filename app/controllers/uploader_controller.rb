#coding:utf-8

class UploaderController < ApplicationController
  before_filter :authenticate_user!

  def upload
    @image = Image.new(img: params[:file])
    authorize! :create, @image
    @image.save
    respond_to do |format|
      format.json do
        res = {"link" => @image.img.url }
        render :json => res.to_json
      end
    end
  end

  def delete
    respond_to do |format|
      format.json do
        res = "ok"
        render :json => res.to_json
      end
    end
  end
end
