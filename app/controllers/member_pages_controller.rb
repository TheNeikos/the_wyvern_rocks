class MemberPagesController < ApplicationController
  before_action :authenticate_member!, :except => [:show]
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end
end
