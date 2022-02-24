class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)

      if params[:order][:address_if]== "3"
        @order.postal_code=current_customer.postcode
        @order.address=current_customer.address
        @order.name="#{current_customer.family_name}#{current_customer.first_name}"
      elsif params[:order][:address_if]== "4"
        @address = Address.find(params[:order][:address_id])
        @order.postal_code = @address.postal_code
        @order.address = @address.address
        @order.name = @address.name
      elsif params[:order][:address_if]== "5"
        @address=current_customer.addresses.new(address_params)
        if @address.valid?
          @order.postal_code = @address.postal_code
          @order.address = @address.address
          @order.name = @address.name
        else
          render 'new'
        end
      end
  end




  def create
    @order = current_customer.orders.new(order_params)
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items
    if @order.save
      @cart_items.each do |cart_item|
        @ordered_item = OrderedItem.new(order_id: @order.id, item_id: cart_item.item_id, amount: cart_item.amount, price: cart_item.item.price)
        @ordered_item.save
        current_customer.cart_items.destroy_all
      end
      redirect_to thanks_path
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



  def thanks
  end

  private
  # ストロングパラメータ


  def address_params
    params.require(:order).permit(:postal_code,:address,:name)
  end


  def order_params
    params.require(:order).permit(:customer_id, :postage, :total_price, :name, :postal_code, :address, :payment_method, :status)
  end
end
