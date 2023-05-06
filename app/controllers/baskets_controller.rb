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
    @basket = Basket.new(basket_params.merge(user_id: current_user.id))

    if @basket.save
      respond_to do |format|
        format.html { redirect_to baskets_path }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /baskets/:id/edit
  def edit
  end

  # PUT /basket/:id
  def update
    respond_to do |format|
      if @basket.update(basket_params)
        format.html { redirect_to basket_url(@basket), notice: "basket was successfully updated." }
        format.json { render :show, status: :ok, location: @basket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @basket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /basket/:id
  def destroy
    @basket.destroy

    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def basket_params
      params.require(:basket).permit(:name)
    end

    def set_basket
      @basket = policy_scope(Basket).find(params[:id])
    end
end
