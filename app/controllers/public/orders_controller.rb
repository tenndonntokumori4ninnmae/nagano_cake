class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
      # if params[:address_id]== "0"
      #   @order.postal_code=current_customer.postal_code
      #   @order.address=current_customer.address
      #   @order.name="#{current_customer.family_name}#{current_customer.first_name}"
      # elsif params[:address_id]== "1"
      #   @address = Address.find(params[:order][:address_id])
      #   @order.postal_code = @address.postal_code
      #   @order.address = @address.address
      #   @order.name = @address.name
      # elsif params[:address_id]== "2"
      #   @address=current_customer.addresses.new(address_params)
      #   if @address.valid?
      #     @order.postal_code = @address.postal_code
      #     @order.address = @address.address
      #     @order.name = @address.name
      #   else
      #     render 'new'
      #   end
      # end
  end

  def create
    @order = current_customer.oerders.new(order_params)
    @order.save
    # current_customer.cart_items.destroy_all
    redirect_to thanks_path
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
    params.permit(:postal_code,:address,:name)
  end
  
  def order_params
    params.require(:order).permit(:customer_id, :postage, :total_price, :name, :postal_code, :address, :payment_method, :status)
  end
end

