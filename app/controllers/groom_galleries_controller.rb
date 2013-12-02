class GroomGalleriesController < ApplicationController
  def index
    @groom_galleries = GroomGallery.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groom_galleries }
    end
  end

  # GET /galleries/1
  # GET /galleries/1.json
  def show
    @groom_gallery = GroomGallery.find(params[:id])
    @groom_picture = @groom_gallery.groom_pictures.build
    @groom_pictures = GroomPicture.find(:all, :conditions  => [ 'groom_gallery_id = ?', @groom_gallery.id ])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @groom_gallery }
    end
  end

  # GET /galleries/new
  # GET /galleries/new.json
  def new
    @groom_gallery = GroomGallery.new
    @groom_gallery.token = @groom_gallery.generate_token
    @groom_picture = @groom_gallery.groom_pictures.build
    @groom_pictures = []

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @groom_gallery }
    end
  end

  # GET /galleries/1/edit
  def edit
    @groom_gallery = GroomGallery.find(params[:id])
    @groom_picture = @groom_gallery.groom_pictures.build
    @groom_pictures = []
  end

  # POST /galleries
  # POST /galleries.json
  def create
    @groom_gallery = GroomGallery.new(params.require(:groom_gallery).permit(:name, :description, :token, :cover))


    if @groom_gallery.save
      redirect_to groom_gallery_path(@groom_gallery), :notice => "Zipcode was saved sucessfully"
    else
      render new_groom_gallery_path
    end
  end

  # PUT /galleries/1
  # PUT /galleries/1.json
  def update
    @groom_gallery = GroomGallery.find(params[:id])

    respond_to do |format|
      if @groom_gallery.update_attributes(params[:groom_gallery_params])
        format.html { redirect_to @groom_gallery, notice: 'Galerie byla úspěšně aktualizováná.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @groom_gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.json
  def destroy
    @groom_gallery = GroomGallery.find(params[:id])
    @groom_gallery.destroy

    respond_to do |format|
      format.html { redirect_to groom_galleries_url }
      format.json { head :no_content }
    end
  end

  private

  def groom_gallery_params
    params.require(:groom_gallery).permit(:description, :name)
  end

end

