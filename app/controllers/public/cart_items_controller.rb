class Public::CartItemsController < ApplicationController
  def index
    @cart_items=current_customer.cart_items
  end
  
  def destroy_all
    current_customer.cart_items.destroy
  end
  
  private
  def cart_items_params
    params.require(:cart_item).permit(:amount, :item_id)
  end
end
