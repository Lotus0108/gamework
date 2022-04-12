class Public::CustomersController < ApplicationController
  def index
  end

  def show
    @public = Public.find(params[:id])
    @items = @public.items.page(params[:page])
  end

  def edit
    @public = Public.find(params[:id])
  end

  def update
    @public = Public.find(params[:id])
    if @public.update(public_params)
      redirect_to customers_path
    else
      render:edit
    end
  end

  def unsubscribe
  end

  private

  def public_params
    params.require(:public).permit(:name)
  end

end
