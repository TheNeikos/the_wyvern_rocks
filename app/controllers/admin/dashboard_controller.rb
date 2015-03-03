class Admin::DashboardController < ApplicationController
  after_action :verify_policy_scoped, :only => []
  def index
    authorize :dashboard
  end
end
