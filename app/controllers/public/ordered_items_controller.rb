class Public::OrderedItemsController < ApplicationController
  
  def index
    @ordered_items = OrderedItem.all
  end
  
  def show
    @ordered_item = OrderedItem.find(params[:id])
  end
end
