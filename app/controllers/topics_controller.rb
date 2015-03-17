class TopicsController < ApplicationController

  def index
  end

  def new
    forum = Forum.find(params[:forum_id])
    @topic = forum.topics.new

    authorize @topic
  end

  def create
    forum = Forum.find(params[:forum_id])
    @topic = forum.topics.build topic_params

    authorize @topic

    @topic.user = current_user

    if @topic.save
      redirect_to [@topic.forum, @topic]
    else
      render :new
    end
  end

  def edit
    @topic = Topic.includes(:posts).find(params[:id])

    authorize @topic
  end

  def update
    @topic = Topic.includes(:posts).find(params[:id])

    authorize @topic

    @topic.update topic_params

    if @topic.save
      respond_to do |format|
        format.html { redirect_to [@topic.forum, @topic] }
        format.js
      end
    else
      render :edit
    end
  end

  def show
    @topic = Topic.includes(:posts).find(params[:id])

    authorize @topic

    @post = @topic.posts.build
    @posts = policy_scope(@topic.posts).includes(:member).paginate(:page => params[:page])
  end

  def destroy
  end

  private

  def topic_params
    params.require(:topic).permit(:content, :name)
  end
end
