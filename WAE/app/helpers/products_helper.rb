module ProductsHelper
  def search_product_query
    session[:product_name].nil? ? '' : session[:product_name]
  end

  def search_product_category
    session[:product_category].nil? ? '' : session[:product_category]
  end

  def show_tooltip_on_not_logged_in(tip, direction = 'top')
    tooltip = ''
    unless (defined?(user_signed_in)).nil? && user_signed_in?
      tooltip = "data-toggle=\"tooltip\" data-placement=\"#{direction}\" title=\"#{tip}\""
    end
    tooltip.html_safe
  end
end
