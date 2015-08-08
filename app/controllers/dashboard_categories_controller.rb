class DashboardCategoriesController < ApplicationController
  def show
    @category = DashboardCategory.find(params[:id])

    authorize @category
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
