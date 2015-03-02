class IndexController < ApplicationController
  after_action :verify_authorized, :except => :dashboard
  def dashboard

  end
end
