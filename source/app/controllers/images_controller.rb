class ImagesController < ApplicationController
  before_filter(:authenticate, :only => [:new, :create])

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)

    @image.asset = params[:image][:asset]
    @image.uploader = current_user

    if @image.save
      redirect_to(image_path(@image), :notice => 'Uploaded Image!')
    else
      render(:new)
    end
  end

  def show
    @image = Image.find(params[:id])
    @comment = Comment.new
    @comments = @image.comments.order('created_at DESC').paginate(:page => params[:page])
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])

    if @image.update(image_params)
      redirect_to(image_path(@image), :notice => 'Updated Image!')
    else
      render(:edit)
    end
  end

  private
    def image_params
      params.require(:image).permit(:tag_list, :asset)
    end
end
