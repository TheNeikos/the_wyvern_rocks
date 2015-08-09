class DashboardPolicy < Struct.new(:user, :dashboard)
  def index?
    valid_and_admin user
  end
end
