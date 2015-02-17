# coding:utf-8

class ImagesController < ApplicationController
  before_filter :authenticate_user!

  # POST /images
  # POST /images.xml
  def create
    @a = Album.find(params[:album_id])
    authorize! :create, Image.new
    errors = []
    if params[:image]
      
      params[:image][:img].each do |img|
        i = @a.images.new(:img => img)
        errors << i.errors.full_messages unless i.save
      end
    else
      errors << "Вы не выбрали фотографию"
    end

    if errors.size == 0
      redirect_to album_path(@a), :notice => "Картинка добавлена"            
    else  
      if errors[0...3] == "img"
        flash[:error]  = "Вы не выбрали файл!"
      else
        flash[:error] = errors.join(", ")
      end

      redirect_to album_path(@a)            
    end
  end

  # DELETE /images/1
  # DELETE /images/1.xml
  def images_destroy
    @album = Album.find(params[:album_id])
    @images = Image.find(params[:image_ids])
    @images.each do |image|
      image.delete
    end
    redirect_to album_path(@album), :notice => "Фотографии удалены"
  end


  def destroy
    @image = Image.find(params[:id])
    authorize! :destroy, @image
    @image.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
  
end
