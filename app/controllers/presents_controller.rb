# coding: utf-8
class PresentsController < ApplicationController
 # GET /presents
  # GET /presents.json
  def index
    @presents = Present.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @presents }
    end
  end

  # GET /presents/1
  # GET /presents/1.json
  def show
    @present = Present.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @present }
    end
  end

  # GET /presents/new
  # GET /presents/new.json
  def new
    @present = Present.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @present }
    end
  end

  # GET /presents/1/edit
  def edit
    @present = Present.find(params[:id])
  end

  # POST /presents
  # POST /presents.json
  def create
    @present = Present.new(present_params)

    respond_to do |format|
      if @present.save
        format.html { redirect_to @present, notice: 'Dar byl úspěšně vytvořen' }
        format.json { render json: @present, status: :created, location: @present }
      else
        format.html { render action: "new" }
        format.json { render json: @present.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /presents/1
  # PUT /presents/1.json
  def update
    @present = Present.find(params[:id])

    respond_to do |format|
      if @present.update_attributes(params[:present])
        format.html { redirect_to @present, notice: 'Dar byl úspěšně aktualizován' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @present.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presents/1
  # DELETE /presents/1.json
  def destroy
    @present = Present.find(params[:id])
    @present.destroy

    respond_to do |format|
      format.html { redirect_to presents_url }
      format.json { head :no_content }
    end
  end

  private

  def present_params
    params.require(:present).permit(:name, :pole)

  end

end
