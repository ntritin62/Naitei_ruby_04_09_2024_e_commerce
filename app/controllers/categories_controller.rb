class CategoriesController < ApplicationController
  include Pagy::Backend
  before_action :find_category, :load_products, only: :show

  def index
    @pagy, @categories = pagy(Category.includes(:products),
                              limit: Settings.page_size)
  end

  def show; end

  private

  def find_category
    @category = Category.find_by(id: params[:id])
    return if @category.present?

    flash[:alert] = t("categories.not_found")
    redirect_to categories_path
  end

  def load_products
    return if @category.blank?

    @pagy, @products = pagy(@category.products, limit: Settings.page_size)
    @product_count = @products.count
  end
end
