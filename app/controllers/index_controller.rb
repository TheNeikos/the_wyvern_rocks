class IndexController < ApplicationController
  after_action :verify_authorized, :except => :dashboard
  def dashboard
    @categories = policy_scope(DashboardCategory)
  end
end
