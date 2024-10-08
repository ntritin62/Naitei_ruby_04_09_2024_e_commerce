module OrdersHelper
  def status_color status
    case status.to_sym
    when :pending
      "text-orange-500 bg-orange-200"
    when :confirmed
      "text-purple-500 bg-purple-200"
    when :preparing
      "text-yellow-500 bg-yellow-200"
    when :delivering
      "text-blue-500 bg-blue-200"
    when :delivered
      "text-green-500 bg-green-200"
    when :cancelled
      "text-red-500 bg-red-200"
    else
      "text-gray-500"
    end
  end

  def first_product_image order
    order.order_items.limit(1).first&.product&.img_url
  end

  def remaining_images_count order
    order.order_items.count - 1
  end

  def product_names order
    order.order_items.limit(3).map{|item| item.product.name}
  end

  def remaining_items_count order
    order.order_items.count - 3
  end
end
