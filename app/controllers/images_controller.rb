class ImagesController < Admin::BaseController
  before_action :require_admin, only: [:new, :create, :destroy]

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:success] = "Image was created!"
      redirect_to image_path(@image)
    else
      render :new
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def destroy
    @image.destroy
    flash[:success] = "Image was succesfully deleted"
    redirect_to images_path
  end

  private

    def image_params
      params.require(:image).permit(:name, :url)
    end

end
