class TopicsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found
  rescue_from Pundit::NotAuthorizedError, with: :handle_not_found

  before_filter :get_topic, only: [:edit, :update, :show, :destroy]

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
      redirect_to @topic
    else
      render :new
    end
  end

  def edit
    authorize @topic
  end

  def update
    authorize @topic

    if params[:commit] == "Cancel"
      respond_to do |format|
        format.html { redirect_to [@topic.forum, @topic] }
        format.js
      end
      return
    end

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
    authorize @topic

    @post = @topic.posts.build
    @posts = policy_scope(@topic.posts).includes(:user).paginate(:page => params[:page])
  end

  def destroy
    authorize @topic

    if params[:close]
      if @topic.closed_at
        @topic.closed_at = nil
      else
        @topic.closed_at = DateTime.now
      end
      @topic.save
    else
      if @topic.deleted_at
        @topic.restore
      else
        @topic.destroy
      end
    end

    respond_to do |format|
      format.html { redirect_to [@topic.forum, @post] }
      format.js
    end
  end

  def not_found
  end

  private

  def get_topic
    @topic = Topic.with_deleted.includes(:posts).find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:content, :name)
  end

  def handle_not_found
    redirect_to topics_not_found_path
  end
end
