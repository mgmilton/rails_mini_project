class IdeasController < ApplicationController
  before_action :require_user
  before_action :set_user
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

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
    if @user.ideas.include?(@idea)
      render :show
    else
      render file: "/public/404"
    end
  end

  def edit
    if @user.ideas.include?(@idea)
      render :edit
    else
      render file: "/public/404"
    end
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

    flash[:success] = "Idea was successfully deleted"
    redirect_to user_ideas_path(user)
  end

  private

    def idea_params
      params.require(:idea).permit(:title, :description, :category_id, image_ids: [])
    end

    def set_idea
      @idea = Idea.find(params[:id])
    end

    def set_user
      @user = current_user
    end

end
