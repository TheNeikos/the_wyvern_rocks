class DashboardPolicy < Struct.new(:user, :dashboard)
  def valid_and_admin user
    user and user.is_admin
  end

  def index?
    valid_and_admin user
  end
end
