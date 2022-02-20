class Public::CartItemsController < ApplicationController

  def index
    @cart_items=current_customer.cart_items
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy
  end

  
  private
  def cart_item_params
    params.permit(:amount, :item_id)
  end

end
