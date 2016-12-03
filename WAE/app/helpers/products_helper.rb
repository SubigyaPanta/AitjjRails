module ProductsHelper
  def search_product_query
    session[:product_name].nil? ? '' : session[:product_name]
  end

  def search_product_category
    session[:product_category].nil? ? '' : session[:product_category]
  end
end
