class IdeasController < ApplicationController
  before_action :require_user
  before_action :current_user
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      flash[:success] = "#{@idea.title} was created!"
      redirect_to idea_path(@idea)
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
      redirect_to idea_path(@idea)
    else
      render :edit
    end
  end

  def destroy
    category = @idea.category
    @idea.destroy

    flash[:success] = "#{@idea.title} was successfully deleted"
    redirect_to ideas_path
  end

  private
    def idea_params
      params.require(:idea).permit(:title, :description, :category_id)
    end

    def set_idea
      @idea = Idea.find(params[:id])
    end

end
