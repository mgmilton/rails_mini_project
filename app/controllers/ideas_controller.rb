class IdeasController < ApplicationController
  before_action :require_user
  before_action :current_user
  before_action :set_idea, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:new, :create, :edit, :index]

  def index
    @ideas = @user.ideas
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = @user.ideas.new(idea_params)
    if @idea.save
      flash[:success] = "#{@idea.title} was created!"
      redirect_to user_idea_path(@idea.user, @idea)
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
      redirect_to user_idea_path(@idea.user, @idea)
    else
      render :edit
    end
  end

  def destroy
    user = @idea.user
    @idea.destroy

    flash[:success] = "#{@idea.title} was successfully deleted"
    redirect_to user_ideas_path(user)
  end

  private

    def idea_params
      params.require(:idea).permit(:title, :description, :category_id)
    end

    def set_idea
      @idea = Idea.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

end
