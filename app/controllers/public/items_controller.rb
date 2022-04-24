class Public::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def index
    @items = Item.page(params[:page])
    @tag_list=Tag.all
  end

  def show
    @item = Item.find(params[:id])
    @item_comment = ItemComment.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.public_id = current_public.id
    tag_list = params[:item][:name].split(',')
    if @item.save
      @item.save_tag(tag_list)
      redirect_to items_path
    else
      render :new
    end
  end

  def update
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :body)
  end

end