class SearchesController < ApplicationController
  def search
		@content = params[:content]
		@items = Item.where(is_active: true).search_for(@content)
	end
end
