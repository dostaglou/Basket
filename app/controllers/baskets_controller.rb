class BasketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_basket, only: %i[ show update edit destroy toggle_items]

  # GET /baskets
  def index
    records= policy_scope(Basket).includes(:basket_items)
    @pagy, @baskets = pagy(records, items: 6)
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

  def toggle_items
    status = params[:status]
    if BasketItem.get_statuses.include?(status)
      basket_item_attributes = @basket.basket_items.each { |bi| bi.status = status }
      respond_to do |format|
        ActiveRecord::Base.transaction do
          if @basket.update(basket_items: basket_item_attributes)
            format.html { redirect_to basket_url(@basket), notice: "Basket items updated" }
            format.turbo_stream {
              render turbo_stream: turbo_stream.replace("basket_#{@basket.id}", render_to_string(partial: 'basket', locals: { basket: @basket }))
            }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @basket.errors, status: :unprocessable_entity }
          end
        end
      end
    end
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
      format.turbo_stream { render turbo_stream: turbo_stream.replace("basket_#{@basket.id}")}
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
