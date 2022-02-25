class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @ordered_items = @order.ordered_items
  end

  def update
    @order = Order.find(params[:id])
    @ordered_items = @order.ordered_items
    @order.update(order_params)

    if @order.status == 'confirm'
      @ordered_items.update_all(status: 'craft_wait')
    end
    redirect_to request.referer
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
