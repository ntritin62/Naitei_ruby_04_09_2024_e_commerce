class Admin::UsersController < Admin::AdminController
  def show
    @user = User.find_by(id: params[:id])

    return unless @user.nil?

    flash[:alert] = t("admin.users_admin.not_found")
    redirect_to admin_users_path
  end
end
