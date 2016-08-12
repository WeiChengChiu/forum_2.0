class TopicCommentsController < ApplicationController

  before_action :set_topic
  before_action :set_comment, :except => [:create]
  before_action :authenticate_user!

  def create
    @comment = @topic.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Created successfuly!!"
    else
      flash[:alert] = "Created failed"
    end
    redirect_to topic_path(@topic)
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      flash[:notice] = "Edited successfuly"
    else
      flash[:alert] = "Edited failed"
    end
    redirect_to topic_path(@topic)
  end

  def destroy
    @comment.destroy
    flash[:alert] = "Deleted successfuly"
    redirect_to topic_path(@topic)
  end

  private

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def set_comment
    @comment = @topic.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:name)
  end
end
