class BlogPostsController < ApplicationController
  def new
    @blog = Blog.find(params[:blog_id])
    @post = @blog.posts.build

    authorize @post
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @post = @blog.posts.build(post_params.merge user: current_user)

    authorize @post

    if @post.save
      redirect_to [@blog, @post]
    else
      render :new
    end
  end

  def edit
    @post = BlogPost.find(params[:id])
    @blog = @post.blog

    authorize @post
  end

  def update
    @post = BlogPost.find(params[:id])
    @blog = @post.blog

    authorize @post

    @post.update(post_params)
    if @post.save
      redirect_to [@blog, @post]
    else
      render :edit
    end
  end

  def show
    @post = BlogPost.find(params[:id])
    @blog = @post.blog

    authorize @post
  end

  def destroy
  end

  private

  def post_params
    params.require(:blog_post).permit(:name, :content, :published)
  end
end
