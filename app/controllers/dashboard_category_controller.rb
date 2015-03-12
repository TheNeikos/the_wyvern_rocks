class DashboardCategoryController < ApplicationController
  def show
    @category = DashboardCategory.find(params[:id])

    authorize @category
  end

  def create
  end

  def update
  end

  def delete
  end
end
