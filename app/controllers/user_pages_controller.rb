class UserPagesController < ApplicationController
  before_action :authenticate_user!, :except => [:show]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
