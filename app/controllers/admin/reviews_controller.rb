class Admin::ReviewsController < ApplicationController
  def index
    @items = Item.page(params[:page])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end
  
  def item_params
    params.require(:item).permit(:title, :body)
  end
end
