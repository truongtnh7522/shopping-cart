class ProductsController < ApplicationController
  def index
    @products = Product.all
    @cart = session[:cart] || {}
    calculate_cart_total
  end

  private

  def calculate_cart_total
    @cart_total = 0
    session[:cart]&.each do |product_id, quantity|
      product = Product.find(product_id)
      @cart_total += product.price * quantity.to_i if quantity.is_a?(Numeric)
    end
  end
end
