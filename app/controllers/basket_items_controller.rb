class BasketItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_basket_item, only: %i[ show edit update destroy ]

  # GET /basket_items
  def index
    records = policy_scope(BasketItem).order([status: :asc, name: :asc])
    @pagy, @basket_items = pagy(records, items: 5)
    @basket_item = BasketItem.new
    @baskets = policy_scope(Basket)
  end

  # GET basket_items/:id
  def show
  end

  # GET basket_items/new
  def new
    @baskets = policy_scope(Basket)
    @basket_item = BasketItem.new
  end

  # POST basket_items
  def create
    @basket_item = BasketItem.new(basket_item_params)

    respond_to do |format|
      if @basket_item.save
        format.turbo_stream
        format.html { redirect_to basket_items_url, notice: "Basket item was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # GET /basket_items/:id/edit
  def edit
    @baskets = policy_scope(Basket)
  end

  # PATCH/PUT /basket_items/:id
  def update
    respond_to do |format|
      if @basket_item.update(basket_item_params)
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace("basket_item_#{@basket_item.id}", render_to_string(partial: 'basket_item', locals: { basket_item: @basket_item }))
        }
        format.html { redirect_to basket_item_path(@basket_item), notice: "Basket item was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /basket_items/:id
  def destroy
    @basket_item.destroy

    respond_to do |format|
      format.html { redirect_to basket_items_url, notice: "Basket item was successfully destroyed." }
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
