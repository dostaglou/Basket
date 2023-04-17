class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items
  def index
    @items = policy_scope(Item)
  end

  # GET /items/:id
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/:id/edit
  def edit
  end

  # POST /items
  def create
    @item = Item.new(item_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @item.save
        format.html { redirect_to item_url(@item), notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/:id
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to item_url(@item), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/:id
  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = policy_scope(Item).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :user_id, :note, :typical_quantity, :typical_measure)
    end
end
