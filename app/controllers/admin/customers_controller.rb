class Admin::CustomersController < ApplicationController
  def index
    @publics = Public.page(params[:page]).per(10)
  end

  def show
    @public = Public.find(params[:id])
  end

  def edit
    @public = Public.find(params[:id])
  end

  def update
    @public = Public.find(params[:id])
    if @public.update(customer_params)
      redirect_to admin_customers_path
    else
      render :edit
    end
  end

  def destroy
    @public = Public.find(params[:id])
    @public.destroy
    redirect_to admin_customers_path
  end

  private
  def customer_params
    params.require(:public).permit(:name, :email, :is_deleted )
  end
end
