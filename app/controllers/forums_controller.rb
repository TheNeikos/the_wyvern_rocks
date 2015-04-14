class ForumsController < ApplicationController
  def show
    @forum = Forum.find(params[:id])

    authorize @forum

    @topics = policy_scope(@forum.topics).order("last_post_created_at DESC")
  end

  def create
  end

  def update
  end

  def delete
  end
end
