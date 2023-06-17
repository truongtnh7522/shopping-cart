class CartsController < ApplicationController
  def add_to_cart
    product_id = params[:product_id]
    session[:cart] ||= {}
    session[:cart][product_id.to_s] = (session[:cart][product_id.to_s] || 0) + 1
    calculate_cart_total
    redirect_to root_path
  end

  def increase_quantity
    product_id = params[:product_id]
    session[:cart][product_id.to_s] += 1
    calculate_cart_total
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def decrease_quantity
    product_id = params[:product_id]
    session[:cart][product_id.to_s] -= 1
    if session[:cart][product_id.to_s] <= 0
      session[:cart].delete(product_id.to_s)
    end
    calculate_cart_total
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def remove_from_cart
    product_id = params[:product_id]
    session[:cart].delete(product_id.to_s)
    calculate_cart_total
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  private

  def calculate_cart_total
    @cart_total = 0
    session[:cart]&.each do |product_id, quantity|
      product = Product.find(product_id)
      subtotal = product.price * quantity.to_i if quantity.is_a?(Numeric)
      @cart_total += subtotal.round(2) if subtotal
    end
  end

end
