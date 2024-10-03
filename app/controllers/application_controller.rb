class ApplicationController < ActionController::Base
  include Pagy::Backend
  include SessionsHelper

  before_action :set_locale

  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def logged_in_user
    return if logged_in?

    flash[:danger] = t ".unauthenticated"
    store_location
    redirect_to login_path, status: :see_other
  end

  def correct_user
    return if current_user? @user

    flash[:danger] = t ".unauthorized"
    redirect_to root_path, status: :see_other
  end
end
