class Public::HomesController < ApplicationController
  def top
    @item = Item.where(is_active: true).order(created_at: :desc).limit(4)
  end

  def about
  end
end
