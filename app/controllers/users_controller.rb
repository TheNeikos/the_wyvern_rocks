class UsersController < ApplicationController
  include UserHelper
  after_action :verify_authorized, :except => [:index, :show, :login]
  # GET
  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  # POST
  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update(user_params)
      flash[:notice] = "Saved Profile successfully."
      redirect_to @user
    else
      render :edit
    end
  end

  # GET
  def index
    @users = policy_scope(User)
  end

  # GET
  def show
    @user = User.find(params[:id])
    authorize @user
  end

  # POST
  def create
    redirect_to '/' if current_user
    @user = User.new(user_params)
    authorize @user

    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  # GET
  def new
    redirect_to '/' if current_user
    @user = User.new
    authorize @user
  end

  # POST
  def login
    @user = User.find_by_email_address(params[:user][:email_address])

    if not @user or not @user.authenticate(params[:user][:password])
      flash[:login_try_email] = params[:user][:email]
      flash[:login_error] = "Could not log you in."
      redirect_to :back
    else
      session[:current_user_id] = @user.id
      redirect_to :back
    end
  end

  # POST
  def logout
      authorize current_user
      session[:current_user_id] = nil
      redirect_to :back
  end

  private

  def user_params
    params.require(:user).permit(:password, :email_address,
                                 :email_address_confirmation, :name,
                                 :old_password, :avatar, :banner, :mc_name)
  end
end
