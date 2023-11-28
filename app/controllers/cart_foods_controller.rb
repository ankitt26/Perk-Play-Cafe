class CartFoodsController < ApplicationController
  before_action :set_cart_food, only: %i[show update destroy]
  load_and_authorize_resource

  def index
    @cart_foods = CartFood.where(cart_id: current_user.cart.id)
    render json: @cart_foods
  end

  # def show
  #   render json: @cart_food
  # end

  def create
    @cart_food = CartFood.new(cart_food_params)

    if @cart_food.save
      render json: @cart_food, status: :created
    else
      render json: { errors: @cart_food.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @cart_food.update(cart_food_params)
      render json: @cart_food
    else
      render json: { errors: @cart_food.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @cart_food.destroy
    render json: { message: 'Food successfully Removed' }
  end

  private

  def set_cart_food
    @cart_food = CartFood.find(params[:id])
  end

  def cart_food_params
    params.require(:cart_food).permit(:food_id).merge(cart_id: current_user.cart_id)
  end
end
