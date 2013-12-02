class BridePicturesController < ApplicationController
  def index

    @bride_gallery = BrideGallery.find(params[:bride_gallery_id])

    @bride_pictures = @bride_gallery.bride_pictures

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bride_pictures }
    end
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @bride_picture = BridePicture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bride_picture }
    end
  end

  # GET /pictures/new
  # GET /pictures/new.json
  def new
    @bride_gallery = BrideGallery.find(params[:bride_gallery_id])
    @bride_picture = @bride_gallery.bride_pictures.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bride_picture }
    end
  end

  # GET /pictures/1/edit
  def edit
    @bride_gallery = BrideGallery.find(params[:bride_gallery_id])

    @bride_picture = @bride_gallery.bride_pictures.find(params[:id])
    # @picture = Picture.find(params[:id])
  end

  # POST /pictures
  # POST /pictures.json
  def create

    p_attr[:image] = params[:bride_picture][:image].first if params[:bride_picture][:image].class == Array

    if params[:bride_gallery_id]
      @bride_gallery = BrideGallery.find(params[:bride_gallery_id])
      @bride_picture = @bride_gallery.bride_pictures.build(bride_params)
    else
      @bride_picture = BridePicture.new(p_attr)
    end

    if @bride_picture.save
      respond_to do |format|
        format.html {
          render :json => [@bride_picture.to_jq_upload].to_json,
                 :content_type => 'text/html',
                 :layout => false
        }
        format.json {
          render :json => [@bride_picture.to_jq_upload].to_json
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  # PUT /pictures/1
  # PUT /pictures/1.json
  def update

    @bride_gallery = BrideGallery.find(params[:bride_gallery_id])

    @bride_picture = @bride_gallery.bride_pictures.find(params[:id])

    respond_to do |format|
      if @bride_picture.update_attributes(params[:bride_picture])
        format.html { redirect_to bride_gallery_path(@bride_gallery), notice: 'Picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bride_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @bride_gallery = BrideGallery.find(params[:bride_gallery_id])
    @bride_picture = @bride_gallery.bride_pictures.find(params[:id])
    @bride_picture.destroy

    respond_to do |format|
      format.html { redirect_to bride_gallery_pictures_url }
      format.js
    end
  end

  def make_default
    @bride_picture = BridePicture.find(params[:id])
    @bride_gallery = BrideGallery.find(params[:bride_gallery_id])

    @bride_gallery.cover = @bride_picture.id
    @bride_gallery.save

    respond_to do |format|
      format.js
    end
  end

  private

  def bride_params
    params.require(:bride_picture).permit(:description, :gallery_id, :image, :crop_x, :crop_y, :crop_w, :crop_h, :gallery_token)
  end

end







