class BasketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_basket, only: %i[ show update edit destroy]

  # GET /baskets
  def index
    @baskets = policy_scope(Basket)
  end

  # GET /baskets/:id
  def show
  end

  # GET /baskets/new
  def new
    @basket = Basket.new
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

    def set_basket
      @basket = policy_scope(Basket).find(params[:id])
    end
end
