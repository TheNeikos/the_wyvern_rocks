class BlogsController < ApplicationController
  def index
    @blogs = policy_scope(Blog)
  end

  def new
    @blog = Blog.new
    authorize @blog
  end

  def create
    @blog = current_member.blogs.build(blog_params)
    authorize @blog

    if @blog.save
      redirect_to @blog
    else
      render :new
    end
  end

  def edit
    @blog = Blog.find(params[:id])
    authorize @blog
  end

  def update
    @blog = Blog.find(params[:id])
    authorize @blog
    @blog.update(blog_params)

    if @blog.save
      redirect_to @blog
    else
      render :edit
    end
  end

  def show
    @blog = Blog.find(params[:id])
    authorize @blog
  end

  def destroy
  end

  private

  def blog_params
    params.require(:blog).permit(:name, :description)
  end
end
