module SessionsHelper
  def logged_in?
    current_user.present?
  end

  def current_user? user
    user == current_user
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
