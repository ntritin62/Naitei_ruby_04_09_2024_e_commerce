class UsersController < ApplicationController
  before_action :find_user, except: %i(index new create)
  before_action :logged_in_user,
                except: %i(new create)
  before_action :correct_user, only: %i(edit update show)

  def show; end

  def index; end

  def new; end

  def create; end

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = t ".success"
      redirect_to @user
      return
    end

    render :edit, status: :unprocessable_entity
  end

  def destroy; end

  private
  def user_params
    params.require(:user).permit User::SIGN_UP_REQUIRE_ATTRIBUTES
  end

  def find_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:warning] = t ".not_found"
    redirect_to root_path
  end

  def admin_user
    redirect_to root_url, status: :see_other unless current_user.admin?
  end
end
