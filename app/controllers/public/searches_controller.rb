class Public::SearchesController < ApplicationController
  before_action :authenticate_public!

  def search
    @range = params[:range]

    if @range == "Public"
      @users = Public.looks(params[:search], params[:word])
    else
      @books = Item.looks(params[:search], params[:word])
    end
  end
end