class BrideController < ApplicationController
  def index
  end

  def gallery
    @galleries = Gallery.all
  end
end
