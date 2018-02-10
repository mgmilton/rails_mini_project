class IdeasController < ApplicationController
  before_action :current_user
  before_action :set_category, only: [:new, :create, :edit]
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  def index
    @ideas = Idea.all
  end

  def new
    @idea = @category.ideas.new
  end

  def create
    @idea = @category.ideas.new(idea_params)
    if @idea.svae
      flash[:success] = "#{@idea.title} was created!"
      redirect_to category_idea_path(@category, @idea)
    else
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    @idea.update(idea_params)
    if @idea.save
      flash[:success] = "#{@idea.title} updated!"
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    category = @idea.category
    @idea.destroy

    flash[:success] = "#{@idea.title} was successfully deleted"
    redirect_to category_path(category)
  end

  private
    def idea_params
      params.require(:idea).permit(:title, :description)
    end

    def set_category
      @category = Category.find(params[:category_id])
    end

    def set_idea
      @idea = Idea.find(params[:id])
    end

end
