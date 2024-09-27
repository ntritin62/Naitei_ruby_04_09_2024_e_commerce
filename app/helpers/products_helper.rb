module ProductsHelper
  def path_args category, page
    if category
      [category, {page:}]
    else
      [page]
    end
  end

  def star_rating rating
    full_stars = rating.to_i
    half_star = (rating % 1) >= 0.5
    empty_stars = 5 - full_stars - (half_star ? 1 : 0)
    {full_stars:, half_star:, empty_stars:}
  end
end
