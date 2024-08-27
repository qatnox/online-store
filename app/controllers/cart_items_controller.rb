class CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[show edit update destroy]

  def index
    @cart_items = CartItem.all
  end

  def show; end

  def new
    @cart_item = CartItem.new
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      redirect_to @cart_item, notice: 'CartItem was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @cart_item.update(cart_item_params)
      redirect_to @cart_item, notice: 'CartItem was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @cart_item.destroy
    redirect_to cart_items_url, notice: 'CartItem was successfully destroyed.'
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:cart_id, :good_id, :quantity)
  end
end
