class DashboardPolicy < Struct.new(:member, :dashboard)
  def index?
    member and member.is_admin
  end
end
