class SearchesController < ApplicationController
  def search
		@content = params[:content]
		@items = Item.search_for(@content)
	end
end
