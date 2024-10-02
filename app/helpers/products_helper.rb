module ProductsHelper
  def path_args category, page
    if category
      [category, {page:}]
    else
      [page]
    end
  end
end
