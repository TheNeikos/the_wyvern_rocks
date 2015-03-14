class ForumsController < ApplicationController
  def show
    @forum = Forum.find(params[:id])

    authorize @forum
  end

  def create
  end

  def update
  end

  def delete
  end
end
