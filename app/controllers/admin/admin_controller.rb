class Admin::AdminController < ApplicationController
  layout "admin"
  before_action :authenticate_admin!

  private

  def authenticate_admin!
    return if current_user&.admin?

    redirect_to root_path, alert: t("admin.access_denied")
  end
end
