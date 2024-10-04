module ReviewsHelper
  def review_star_rating rating
    stars = (1..5).map do |i|
      class_name = i <= rating ? "text-yellow-500" : "text-gray-300"
      content_tag(:span, "★", class: class_name)
    end

    safe_join(stars)
  end
end
