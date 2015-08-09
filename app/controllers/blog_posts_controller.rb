class BlogPostsController < ApplicationController
  def new
    @blog = get_blog(params[:blog_id])
    @post = @blog.posts.build

    authorize @post
  end

  def create
    @blog = get_blog(params[:blog_id])
    @post = @blog.posts.build(post_params.merge user: current_user)

    authorize @post

    if @post.save
      redirect_to [@blog, @post]
    else
      render :new
    end
  end

  def edit
    @post = get_blog_post(params[:id])
    @blog = @post.blog

    authorize @post
  end

  def update
    @post = get_blog_post(params[:id])
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
    @post = get_blog_post(params[:id])
    @blog = @post.blog

    authorize @post
  end

  def destroy
  end

  private

  def get_blog id
    Blog.find id
  end

  def get_blog_post id
    BlogPost.find(id)
  end

  def post_params
    params.require(:blog_post).permit(:name, :content, :published)
  end
end
