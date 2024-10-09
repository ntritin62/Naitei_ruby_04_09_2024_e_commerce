class SessionsController < ApplicationController
  before_action :find_user, only: :create

  def new; end

  def create
    if invalid_login?
      show_login_fail_msg
      return render :new, status: :unprocessable_entity
    end

    if inactive_user?
      show_not_activated_msg
      return render :new, status: :unprocessable_entity
    end

    handle_remember_me
    log_in_and_redirect
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url, status: :see_other
  end

  private

  def find_user
    @user = User.find_by(email: params.dig(:session, :email)&.downcase)
  end

  def invalid_login?
    !@user.try(:authenticate, params.dig(:session, :password))
  end

  def inactive_user?
    !@user&.activated?
  end

  def handle_remember_me
    params.dig(:session, :remember_me) == "1" ? remember(@user) : forget(@user)
  end

  def log_in_and_redirect
    log_in @user
    show_login_success_msg

    if @user.admin?
      redirect_to admin_dashboard_path
    else
      redirect_to session[:forwarding_url] || root_path
    end
  end

  def show_login_success_msg
    flash[:success] = t ".successful"
  end

  def show_login_fail_msg
    flash.now[:danger] = t ".invalid"
  end

  def show_not_activated_msg
    flash.now[:danger] = t ".not_activated"
  end
end
