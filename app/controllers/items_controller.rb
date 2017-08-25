class ItemsController < ApplicationController
  def index
  	@items =Item.all
    #@item =Item.find(params[:id])
  end
  def new
	@item = Item.new
  end
  def create
   
  	@item =Item.new(item_params)
  	@item.save
  	redirect_to items_path 
  end

  def item_params
  	params.require(:item).permit(:picture ,:name ,:price).merge(user_id: current_user.id)
  end
end
