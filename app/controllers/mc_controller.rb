class McController < ApplicationController
  def show
    @user = User.find_by_mc_name(params[:name])

    authorize @user

    render :show, layout: nil
  end
end
