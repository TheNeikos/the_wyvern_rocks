class ForumsController < ApplicationController
  def show
    @forum = Forum.find(params[:id])

    authorize @forum

    @topics = policy_scope(@forum.topics)
  end

  def create
    # TODO: Implement
  end

  def update
    # TODO: Implement
  end

  def delete
    # TODO: Implement
  end
end
