class Admin::OrderedItemsController < ApplicationController

  def update
    @ordered_item = OrderedItem.find(params[:id])
    @order = @ordered_item.order
    @ordered_items = @order.ordered_items
    @ordered_item.update(ordered_item_params)
    if @ordered_items.exists?(status: 'in_crafting') == true
      @order.update(status: 'crafting')

    end
    @completed_items = @ordered_items.where(status: 'complete')

    if @ordered_items.count == @completed_items.count
      @order.update(status: 'preparation')
    end
    redirect_to admin_order_path(@order.id)
  end
  private

  def ordered_item_params
    params.require(:ordered_item).permit(:status)
  end
end
