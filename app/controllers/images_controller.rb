class ImagesController < ApplicationController
  load_and_authorize_resource

  def index
    @images = Image.order('created_at desc').paginate(page: params[:page])
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)

    @image.asset = params[:image][:asset]
    @image.uploader = current_user

    if @image.save
      redirect_to(image_path(@image))
    else
      render(:new)
    end
  end

  def show
    @image = Image.find(params[:id])
    @comment = Comment.new
    @comments = @image.comments.order('created_at DESC').paginate(page: params[:page])
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])

    if @image.update(image_params)
      redirect_to(image_path(@image))
    else
      render(:edit)
    end
  end

  def destroy
    @image = Image.find(params[:id])

    if @image.destroy
      redirect_to(root_path)
    else
      redirect_to(root_path, alert: 'Failed to delete image.')
    end
  end

  private

  def image_params
    params.require(:image).permit(:tag_list, :artist, :source, :asset, :asset_cache)
  end
end
