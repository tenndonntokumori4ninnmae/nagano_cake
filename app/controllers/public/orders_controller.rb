class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items
    if @order.save
      @cart_items.each do |cart_item|
       @ordered_item = OrderedItem.new(order_id: @order.id, item_id: cart_item.item_id, amount: cart_item.amount, price: cart_item.item.price)
       @ordered_item.save
      end
      redirect_to orders_path(@order.id)
    else
      render :index
    end
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @ordered_items = @order.ordered_items
  end

  def confirm
    @order = Order.new(order_params)
  end

  def thanks
  end

  private
  # ストロングパラメータ
  def order_params
    params.require(:order).permit(:customer_id, :postage, :total_price, :name, :postal_code, :address, :payment_method, :status)
  end

end

