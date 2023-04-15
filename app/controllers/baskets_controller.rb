class BasketsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_basket, only: [:show, :update, :edit, :destroy]

  # GET /baskets
  def index
    @baskets = Basket.where(user_id: current_user.id)
  end

  # GET /baskets/:id
  def show
    @basket = Basket.find(params[:id])
  end

  # GET /baskets/new
  def new
    @basket = Basket.new(user_id: current_user.id)
  end

  # POST /baskets/create
  def create
    basket = Basket.create!(basket_params.merge(user_id: current_user.id))
    redirect_to basket_path(basket)
  end

  # GET /baskets/:id/edit
  def edit
  end

  # PUT /basket/:id
  def update
    @basket.update!(basket_params)
    redirect_to basket_path(@basket)
  end

  # DELETE /basket/:id
  def destroy
    @basket.destroy!
    redirect_to baskets_path
  end

  private
    def basket_params
      params.require(:basket).permit(:name)
    end

    def find_basket
      @basket = Basket.find(params[:id])
    end
end
