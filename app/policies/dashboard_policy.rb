class DashboardPolicy < Struct.new(:user, :dashboard)
  def index?
    user and user.is_admin
  end
end
