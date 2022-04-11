class Public::CustomersController < ApplicationController
  def index
  end

  def show
    @public = Public.find(params[:id])
    @items = @public.items
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end
end
