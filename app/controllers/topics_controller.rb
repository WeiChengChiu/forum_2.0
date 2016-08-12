class TopicsController < ApplicationController

  before_action :set_topic, :only => [:show, :update, :edit, :destroy]
  before_action :authenticate_user!, :except => [:index, :show]



  def index
    @topic = Topic.new
    @topics = Topic.all
  end

  def show
    @comments = @topic.comments.all
    @comment = @topic.comments.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topics = Topic.all

    if @topic.save
      flash[:notice] = "Created successfuly!!"
      redirect_to topics_path
    else
      render :index
    end
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      flash[:notice] = "Update successfuly!!"
      redirect_to topics_path
    else
      render :edit
    end
  end

  def destroy
    @topic.destroy
    flash[:alert] = "Deleted successfuly!!"
    redirect_to topics_path
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:name, :description)
  end

end
