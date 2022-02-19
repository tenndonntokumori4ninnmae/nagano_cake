class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to orders_path(@order.id)
    else
      render :index
    end
  end

  def index
  end

  def show
  end

  def confirm
  end

  def thanks
  end

  private
  # ストロングパラメータ
  def order_params
    params.require(:order).permit(:customer_id, :postage, :total_price, :name, :postal_code, :address, :payment_method, :status)
  end

end
