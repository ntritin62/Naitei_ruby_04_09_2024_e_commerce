class CartsController < ApplicationController
  before_action :logged_in_user,
                :set_cart,
                only: %i(show
                        add_item
                        increment_item
                        decrement_item
                        remove_item)
  before_action :set_product_and_quantity, only: :add_item
  before_action :set_user, :correct_user, only: %i(show)
  before_action :find_cart_item,
                only: %i(increment_item
                        decrement_item
                        remove_item)

  def show
    cart_items_query = @cart.cart_items.includes(product: :category)
    @pagy, @cart_items = pagy cart_items_query, limit: Settings.ui.cart_items
    calculate_total
  end

  def add_item
    @cart_item = @cart.cart_items.find_by product_id: @product_id
    if @cart_item.nil?
      add_new_item_to_cart
    else
      update_existing_cart_item
    end
    calculate_total
    respond_to do |format|
      format.html{redirect_to product_path(@product)}
      format.turbo_stream
    end
  end

  def increment_item
    if can_increment_item?
      increment_cart_item
    else
      flash.now[:error] = t "carts.insufficient_stock"
    end
    calculate_total
    respond_to do |format|
      format.html{redirect_to cart_path(@cart)}
      format.turbo_stream
    end
  end

  def decrement_item
    if can_decrement_item?
      decrement_cart_item
    else
      remove_cart_item
    end
    calculate_total
    respond_to do |format|
      format.html{redirect_to cart_path(@cart)}
      format.turbo_stream
    end
  end

  def remove_item
    @cart_item.destroy
    flash.now[:success] = t "carts.item_removed_success"
    calculate_total
    respond_to do |format|
      format.html{redirect_to cart_path(@cart)}
      format.turbo_stream
    end
  end

  private
  def set_cart
    @cart = current_user.cart || current_user.create_cart
  end

  def set_user
    cart = Cart.find_by id: params[:id]
    return @user = cart.user if cart.present?

    flash[:danger] = t "carts.cart_not_found"
    redirect_to root_path
  end

  def set_product_and_quantity
    @quantity = params[:quantity].to_i
    @product_id = params[:product_id]
    @product = Product.find_by id: @product_id
    return if @product

    flash[:danger] = t "carts.product_not_found"
    redirect_to root_path
  end

  def find_cart_item
    @cart_item = @cart.cart_items.find_by id: params[:id]
    return @product = @cart_item.product if @cart_item.present?

    flash[:danger] = t "carts.cart_item_not_found"
    redirect_to root_path
  end

  def add_new_item_to_cart
    if @quantity > @product.stock
      flash.now[:error] = t "carts.insufficient_stock"
    else
      @cart_item = @cart.cart_items.build(
        product_id: @product.id,
        quantity: @quantity
      )
      if @cart_item.save
        flash.now[:success] = t "carts.item_added_success"
      else
        flash.now[:danger] = t "carts.item_added_error"
      end
    end
  end

  def update_existing_cart_item
    new_quantity = @cart_item.quantity + @quantity
    if new_quantity > @product.stock + @cart_item.quantity
      flash.now[:error] = t "carts.insufficient_stock"
    elsif @cart_item.update(quantity: new_quantity)
      flash.now[:success] = t "carts.item_added_success"
    else
      flash.now[:danger] = t "carts.item_added_error"
    end
  end

  def can_increment_item?
    @product.stock >= 1
  end

  def increment_cart_item
    @cart_item.quantity += 1
    if @cart_item.save
      flash.now[:success] = t "carts.item_increment_success"
    else
      flash.now[:error] = t "carts.insufficient_stock"
    end
  end

  def can_decrement_item?
    @cart_item.quantity > 1
  end

  def decrement_cart_item
    @cart_item.quantity -= 1
    if @cart_item.save
      flash.now[:success] = t "carts.item_decrement_success"
    else
      flash.now[:error] = t "carts.insufficient_stock"
    end
  end

  def remove_cart_item
    @cart_item.destroy
    flash.now[:success] = t "carts.item_removed_success"
  end

  def calculate_total
    cart_items_with_price = @cart.cart_items.includes(:product)
    @total = cart_items_with_price.sum("cart_items.quantity * products.price")
  end

  def current_cart_items
    @cart.cart_items.includes(product: :category)
  end
end
