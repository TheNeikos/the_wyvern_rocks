class UserPagesController < ApplicationController
  before_action :authenticate_user!, :except => [:show]
  after_filter :verify_authorized,  except: [:show, :finish_signup, :index]
  after_filter :verify_policy_scoped, only: [:index]

  def index
    @users = policy_scope(User)
  end

  def show
    @user = User.find(params[:id]).name
  end

  # GET/PATCH /user_page/:id/finish_signup
  def finish_signup
    # authorize! :update, @user
    if request.patch? && params[:user] #&& params[:user][:email]
      if @user.update(user_params)
        @user.skip_reconfirmation!
        sign_in(@user, :bypass => true)
        redirect_to @user, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end
end
