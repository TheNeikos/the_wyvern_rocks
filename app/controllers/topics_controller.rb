class TopicsController < ApplicationController
  before_filter :load_forum

  def index
  end

  def new
    @topic = @forum.topics.build

    authorize @topic
  end

  def create
    @topic = @forum.topics.build topic_params

    authorize @topic

    @topic.user = current_user

    if @topic.save
      redirect_to [@forum, @topic]
    else
      render :new
    end
  end

  def edit
    @topic = @forum.topics.includes(:posts).find(params[:id])

    authorize @topic
  end

  def update
    @topic = @forum.topics.includes(:posts).find(params[:id])

    authorize @topic

    @topic.update topic_params

    if @topic.save
      respond_to do |format|
        format.html { redirect_to [@forum, @topic] }
        format.js
      end
    else
      render :edit
    end
  end

  def show
    @topic = @forum.topics.includes(:posts).find(params[:id])

    authorize @topic

    @posts = policy_scope(@topic.posts).includes(:user).paginate(:page => params[:page])
  end

  def destroy
  end

  private

  def load_forum
    @forum = Forum.find(params[:forum_id])
  end

  def topic_params
    params.require(:topic).permit(:content, :name)
  end
end
