class OrdersController < ApplicationController
  before_action :set_cart_items, only: [:new, :create]
  before_action :set_order, only: [:show]

  def new
    @order = Order.new
    @order.total = calculate_cart_total
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = calculate_cart_total

    if @order.save
      save_order_items(@order)
      clear_cart
      redirect_to order_path(@order)
    else
      flash.now[:alert] = t ".order_fail"
      render :new
    end
  end

  def show; end

  private

  def set_cart_items
    @cart_items = current_cart_items
  end

  def current_cart_items
    current_user.cart.cart_items.includes(product: :category)
  end

  def set_order
    @order = Order.find_by(id: params[:id])
    return if @order

    flash[:alert] = t ".order_not_found"
    redirect_to root_path
  end

  def order_params
    params.require(:order).permit(
      Order::UPDATE_ORDER
    )
  end

  def calculate_cart_total
    @cart_items.sum{|item| item.product.price * item.quantity}
  end

  def save_order_items order
    @cart_items.each do |item|
      order.order_items.create(product_id: item.product_id,
                               price: item.product.price,
                               quantity: item.quantity)
      if item.product.stock >= item.quantity
        item.product.decrement!(:stock,
                                item.quantity)
      end
    end
  end

  def clear_cart
    current_user.cart.cart_items.destroy_all
  end
end
