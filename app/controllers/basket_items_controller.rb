class BasketItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_basket_item, only: %i[ show edit update destroy ]

  # GET /basket_items
  def index
    @basket_items = policy_scope(BasketItem)
  end

  # GET basket_items/:id
  def show
  end

  # GET basket_items/new
  def new
    @baskets = policy_scope(Basket)
    @items = policy_scope(Item)
    @basket_item = BasketItem.new
  end

  # POST basket_items
  def create
    @basket_item = BasketItem.new(basket_item_params)

    respond_to do |format|
      if @basket_item.save
        format.html { redirect_to basket_item_url(@basket_item), notice: "Basket item was successfully created." }
        format.json { render :show, status: :created, location: @basket_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @basket_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /basket_items/:id/edit
  def edit
    @baskets = Basket.where(user_id: current_user.id)
    @items = Item.where(user_id: current_user.id)
  end

  # PATCH/PUT /basket_items/:id
  def update
    respond_to do |format|
      if @basket_item.update(basket_item_params)
        format.html { redirect_to basket_item_url(@basket_item), notice: "Basket item was successfully updated." }
        format.json { render :show, status: :ok, location: @basket_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @basket_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /basket_items/:id
  def destroy
    @basket_item.destroy

    respond_to do |format|
      format.html { redirect_to basket_items_url, notice: "Basket item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_basket_item
      @basket_item = policy_scope(BasketItem).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def basket_item_params
      params.require(:basket_item).permit(:basket_id, :item_id, :name, :note, :quantity, :measure, :status)
    end
end
