class BrideGalleriesController < ApplicationController
  def index
    @bride_galleries = BrideGallery.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bride_galleries }
    end
  end

  # GET /galleries/1
  # GET /galleries/1.json
  def show
    @bride_gallery = BrideGallery.find(params[:id])
    @bride_picture = @bride_gallery.bride_pictures.build
    @bride_pictures = BridePicture.find(:all, :conditions  => [ 'bride_gallery_id = ?', @bride_gallery.id ])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bride_gallery }
    end
  end

  # GET /galleries/new
  # GET /galleries/new.json
  def new
    @bride_gallery = BrideGallery.new
    @bride_gallery.token = @bride_gallery.generate_token
    @bride_picture = @bride_gallery.bride_pictures.build
    @bride_pictures = []

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bride_gallery }
    end
  end

  # GET /galleries/1/edit
  def edit
    @bride_gallery = BrideGallery.find(params[:id])
    @bride_picture = @bride_gallery.bride_pictures.build
    @bride_pictures = []
  end

  # POST /galleries
  # POST /galleries.json
  def create
    @bride_gallery = BrideGallery.new(params.require(:bride_gallery).permit(:name, :description, :token, :cover))


    if @bride_gallery.save
      redirect_to bride_gallery_path(@bride_gallery), :notice => "Zipcode was saved sucessfully"
    else
      render new_bride_gallery_path
    end
  end

  # PUT /galleries/1
  # PUT /galleries/1.json
  def update
    @bride_gallery = Bridegallery.find(params[:id])

    respond_to do |format|
      if @bride_gallery.update_attributes(params[:bride_gallery])
        format.html { redirect_to @bride_gallery, notice: 'Galerie byla úspěšně aktualizováná.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bride_gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.json
  def destroy
    @bride_gallery = BrideGallery.find(params[:id])
    @bride_gallery.destroy

    respond_to do |format|
      format.html { redirect_to bride_galleries_url }
      format.json { head :no_content }
    end
  end

  private

  def gallery_params
    params.require(:bride_gallery).permit(:cover, :description, :name, :token)
  end

end


