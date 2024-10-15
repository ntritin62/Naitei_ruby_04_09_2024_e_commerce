# app/helpers/admin/application_helper.rb
module Admin::ApplicationHelper
  def product_image product
    product.img_url.presence || "default_image_url_here"
  end

  def active_class link_path
    if request.path == url_for(link_path)
      "bg-primary_hover border-blue-500 font-bold text-lg"
    else
      "border-transparent"
    end
  end
end
