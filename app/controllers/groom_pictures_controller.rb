class GroomPicturesController < ApplicationController
  def index

    @groom_gallery = GroomGallery.find(params[:groom_gallery_id])

    @groom_pictures = @groom_gallery.groom_pictures

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groom_pictures }
    end
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @groom_picture = GroomPicture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @groom_picture }
    end
  end

  # GET /pictures/new
  # GET /pictures/new.json
  def new
    @groom_gallery = GroomGallery.find(params[:groom_gallery_id])
    @groom_picture = @groom_gallery.groom_pictures.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @groom_picture }
    end
  end

  # GET /pictures/1/edit
  def edit
    @groom_gallery = GroomGallery.find(params[:groom_gallery_id])

    @groom_picture = @groom_gallery.groom_pictures.find(params[:id])
    # @picture = Picture.find(params[:id])
  end

  # POST /pictures
  # POST /pictures.json
  def create

    p_attr[:image] = params[:groom_picture][:image].first if params[:groom_picture][:image].class == Array

    if params[:groom_gallery_id]
      @groom_gallery = GroomGallery.find(params[:groom_gallery_id])
      @groom_picture = @groom_gallery.groom_pictures.build(picture_params)
    else
      @groom_picture = GroomPicture.new(p_attr)
    end

    if @groom_picture.save
      respond_to do |format|
        format.html {
          render :json => [@groom_picture.to_jq_upload].to_json,
                 :content_type => 'text/html',
                 :layout => false
        }
        format.json {
          render :json => [@groom_picture.to_jq_upload].to_json
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  # PUT /pictures/1
  # PUT /pictures/1.json
  def update

    @groom_gallery = GroomGallery.find(params[:groom_gallery_id])

    @groom_picture = @groom_gallery.groom_pictures.find(params[:id])

    respond_to do |format|
      if @groom_picture.update_attributes(params[:groom_picture])
        format.html { redirect_to groom_gallery_path(@groom_gallery), notice: 'Picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @groom_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @groom_gallery = GroomGallery.find(params[:groom_gallery_id])
    @groom_picture = @groom_gallery.groom_pictures.find(params[:id])
    @groom_picture.destroy

    respond_to do |format|
      format.html { redirect_to groom_gallery_pictures_url }
      format.js
    end
  end

  def make_default
    @groom_picture = GroomPicture.find(params[:id])
    @groom_gallery = GroomGallery.find(params[:groom_gallery_id])

    @groom_gallery.cover = @groom_picture.id
    @groom_gallery.save

    respond_to do |format|
      format.js
    end
  end

  private

  def picture_params
    params.require(:groom_picture).permit(:description, :gallery_id, :image, :crop_x, :crop_y, :crop_w, :crop_h, :gallery_token)
  end

end

