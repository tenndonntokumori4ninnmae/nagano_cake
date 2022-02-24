class Public::ItemsController < ApplicationController
  def index
    @items = Item.where(is_active: true).page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
  end
end
