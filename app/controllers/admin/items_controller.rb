class Admin::ItemsController < ApplicationController
  def index
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
  @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      render :new #<= new から indexに変更
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end


  def edit
    @item = Item.find(params[:id])
  end

   private
  # ストロングパラメータ
  def item_params
    params.require(:item).permit(:image_id, :name, :price, :is_active, :introduction)
  end
end
