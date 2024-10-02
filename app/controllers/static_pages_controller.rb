class StaticPagesController < ApplicationController
  def home
    @products = Product.order(rating: :desc).limit(Settings.index_size)
  end

  def help; end

  def contact; end
end
