class Admin::ItemsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
  @items = Item.new(Item_params)
    if @item.save
      redirect_to admin_items_path(@item.id)
    else
      render :new #<= new から indexに変更
    end
  end


  def edit
  end

   private
  # ストロングパラメータ
  def Item_params
    params.require(:Item).permit(:image_id, :name, :price, :is_active, :introduction)
  end
end
