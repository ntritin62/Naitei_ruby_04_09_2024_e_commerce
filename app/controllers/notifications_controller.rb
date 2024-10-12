class NotificationsController < ApplicationController
  before_action :find_user, :logged_in_user, :correct_user, :find_notification,
                only: :mark_as_read
  def mark_as_read
    if @notification.update(read: true)
      redirect_to user_order_order_details_path(@notification.user,
                                                @notification.order)
    else
      flash[:danger] = t "notifications.update_failed"
      redirect_to root_path
    end
  end

  private
  def find_user
    @user = User.find_by id: params[:user_id]
    return if @user

    flash[:danger] = t "notifications.user_not_found"
    redirect_to root_path
  end

  def find_notification
    @notification = @user.notifications.find_by id: params[:id]
    return if @notification

    flash[:danger] = t "notifications.notfication_not_found"
    redirect_to root_path
  end
end
