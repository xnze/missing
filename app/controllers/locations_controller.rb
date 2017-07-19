class LocationsController < ApplicationController
  before_action :set_loction, only: [:edit, :update]
  before_action :set_post, only: [:new, :create, :edit]

  def new
    @location = Location.new
    authorize @location
  end

  def create
    @location = Location.new(location_params)
    @post.location = @location
    authorize @location
    if @location.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    authorize @location
  end

  def update
    @location.update(location_params)
    authorize @location
  end

  private

    def location_params
      params.require(:location).permit(:name, :address)
    end

    def set_location
      @location = Location.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end
end
