class MemberPagesController < ApplicationController
  before_action :authenticate_member!, :except => [:show]
  after_filter :verify_authorized,  except: [:show, :finish_signup, :index]
  after_filter :verify_policy_scoped, only: [:index, :show]

  def index
    @members = policy_scope(Member)
  end

  def show
    @member = Member.find(params[:id])
  end

  # GET/PATCH /member_page/:id/finish_signup
  def finish_signup
    # authorize! :update, @member
    if request.patch? && params[:member] #&& params[:member][:email]
      if @member.update(member_params)
        @member.skip_reconfirmation!
        sign_in(@member, :bypass => true)
        redirect_to @member, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end
end
