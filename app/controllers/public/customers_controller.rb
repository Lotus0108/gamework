class Public::CustomersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]

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
      redirect_to customer_path
    else
      render:edit
    end
  end

  

  def ensure_guest_user
    @public = Public.find(params[:id])
    if @public.name == "guestuser"
      redirect_to customer_path(current_public) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

  private

  def public_params
    params.require(:public).permit(:name)
  end

end
