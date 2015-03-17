class PostsController < ApplicationController

  def new
    topic = Topic.find(params[:topic_id])
    @post = topic.posts.build

    authorize @post
  end

  def create
    topic = Topic.find(params[:topic_id])
    @post = topic.posts.build post_params
    @post.member = current_member

    authorize @post

    if @post.save
      respond_to do |format|
        format.html { redirect_to [topic.forum, topic] }
        format.js
      end
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])

    authorize @post
  end

  def update
    @post = Post.find(params[:id])

    authorize @post

    @post.update post_params

    if @post.save
      respond_to do |format|
        format.html { redirect_to [@post.topic.forum, @post.topic] }
        format.js
      end
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def load_forum_and_topic
    @forum = Forum.find(params[:forum_id])
    @topic = Topic.find(params[:topic_id])
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
