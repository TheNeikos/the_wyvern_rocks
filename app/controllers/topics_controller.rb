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
  end

  def update
  end

  def show
    @topic = @forum.topics.find(params[:id])

    authorize @topic
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
