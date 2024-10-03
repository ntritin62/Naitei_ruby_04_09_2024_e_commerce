class ProductsController < ApplicationController
  include Pagy::Backend
  def index
    @pagy, @products = pagy(Product.all, limit: Settings.page_size)
    @product_count = Product.count
  end

  def show
    @product = Product.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to products_path, alert: t("products.not_found")
  end
end
