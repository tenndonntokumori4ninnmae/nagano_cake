class Admin::OrderedItemController < ApplicationController
  def update
    @ordered_item = OrderedItem.find(params[:id])
    @ordered_item.update(ordered_item.id)
    redirect_to 
  end
end
