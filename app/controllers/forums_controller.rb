class ForumsController < ApplicationController
  def show
    @forum = Forum.find(params[:id])

    authorize @forum

    @topics = policy_scope(@forum.topics)
  end

  def create
  end

  def update
  end

  def delete
  end
end
