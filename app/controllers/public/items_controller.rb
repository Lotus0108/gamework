class Public::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def index
    @items = Item.all
  end

  def show
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.publics_id = current_public.id
    @item.save
    redirect_to items_path
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.permit(:title, :body)
  end
end