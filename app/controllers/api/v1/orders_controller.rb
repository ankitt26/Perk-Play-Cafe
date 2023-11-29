class Api::V1::OrdersController < ApplicationController
  before_action :set_order, only: %i[show update destroy]
  load_and_authorize_resource

  # GET /orders
  def index
    @orders = current_user.orders.includes(:foods) # Use eager loading to avoid N+1 queries
    render json: @orders, include: :foods
  end

  # GET /orders/1
  def show
    # render json: @order
    @order = Order.find(params[:id])
    render json: @order, include: :foods
  end

  # POST /orders
  def create
    @order = Order.new(order_params)

    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  # def destroy
  #   @order.destroy
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(:address_id, :delivered).merge(user_id: current_user.id)
  end
end
