module UserHelper
  def current_user
    begin
      @_current_user ||= session[:current_user_id] &&
        User.find(session[:current_user_id])
    rescue ActiveRecord::RecordNotFound
      session[:current_user_id] = nil
    end
  end
end
