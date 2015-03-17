class MemberPagesController < ApplicationController
  before_action :authenticate_member!, :except => [:show]
  after_action :verify_authorized, :except => [:show, :index, :finish_signup]
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  # GET/PATCH /users/:id/finish_signup
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
