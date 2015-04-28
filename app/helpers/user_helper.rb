module UserHelper
  def current_user
    begin
      @_current_user ||= session[:current_user_id] &&
        User.find(session[:current_user_id])
    rescue ActiveRecord::RecordNotFound
      session[:current_user_id] = nil
    end
  end

  def user_link_to user
    render partial: 'user/link_to', locals: {user: user}
  end
end
