class CategoriesController < Admin::BaseController
  before_action :require_admin, except: [:index, :show]
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "#{@category.name} was created!"
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def edit

  end

  def update
    @category.update(category_params)
    if @category.save
      flash[:success] = "#{@category.name} updated!"
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    name = @category.name
    @category.destroy
    flash[:success] = "Category #{name} was succesfully deleted"
    redirect_to categories_path
  end

  private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
