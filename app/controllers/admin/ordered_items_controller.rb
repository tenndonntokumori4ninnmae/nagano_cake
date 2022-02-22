class Admin::OrderedItemsController < ApplicationController
  def update
    @ordered_item = OrderedItem.find(params[:id])
    @ordered_item.update(ordered_item_params)
    redirect_to admin_order_path(@ordered_item.id)
  end
  private

  def ordered_item_params
    params.require(:ordered_item).permit(:status)
  end
end
