class OrderItemsController < ApplicationController
  before_action :set_order_item, only: %i[show edit update destroy]

  def index
    @order_items = OrderItem.all
  end

  def show; end

  def new
    @order_item = OrderItem.new
  end

  def create
    @order_item = OrderItem.new(order_item_params)
    if @order_item.save
      redirect_to @order_item, notice: 'OrderItem was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @order_item.update(order_item_params)
      redirect_to @order_item, notice: 'OrderItem was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @order_item.destroy
    redirect_to order_items_url, notice: 'OrderItem was successfully destroyed.'
  end

  private

  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end

  def order_item_params
    params.require(:order_item).permit(:order_id, :good_id, :quantity, :price)
  end
end
