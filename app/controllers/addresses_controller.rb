class AddressesController < ApplicationController
  before_action :set_user, :logged_in_user, :correct_user
  before_action :set_address, only: %i(edit update destroy)

  def index
    @default_address = @user.addresses.default_address
    addresses = @user.addresses.not_default_address.ordered_by_updated_at
    @pagy, @addresses = pagy addresses, limit: Settings.ui.address_limit
  end

  def new
    @address = @user.addresses.build
  end

  def create
    Address.set_default_false(@user) if params.dig(:address, :default) == "1"
    @address = @user.addresses.build(address_params)

    if @address.save
      flash[:success] = t ".success"
      redirect_to user_addresses_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    Address.set_default_false(@user) if params.dig(:address, :default) == "1"
    if @address.update address_params
      flash[:success] = t ".success"
      redirect_to user_addresses_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @address.destroy
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".fail"
    end
    redirect_to user_addresses_path(@user)
  end

  private
  def set_user
    @user = User.find_by id: params[:user_id]
    return if @user

    flash[:warning] = t ".not_found"
    redirect_to root_path
  end

  def set_address
    @address = @user.addresses.find_by id: params[:id]
    return if @address

    flash[:warning] = t ".not_found_address"
    redirect_to user_addresses_path(@user)
  end

  def address_params
    params.require(:address).permit Address::ADDRESS_REQUIRE_ATTRIBUTES
  end
end
