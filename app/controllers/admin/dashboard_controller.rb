class Admin::DashboardController < Admin::AdminController
  def index
    @total_categories = Category.count
    @total_products = Product.count
    @total_users = User.count
    @total_orders = Order.count
    @total_revenue = Order.total_revenue
    @highest_rated_product = Product.highest_rated
    @top_user = User.top_user
    @top_user_order_count = @top_user.present? ? @top_user.orders.count : 0
  end
end
