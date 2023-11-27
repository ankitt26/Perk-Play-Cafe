class OrderFoodsController < ApplicationController
   
  before_action :set_order_food, only: %i[show update destroy]
    
  # def index
  #   @order_foods = OrderFood.where(order_id: current_user.orders.pluck(:id))
  #   render json: @order_foods
  # end
  
    # def show
    #   render json: @order_food
    # end
  
    def create
      @order_food = OrderFood.new(order_food_params)
  
      if @order_food.save
        render json: @order_food, status: :created
      else
        render json: { errors: @order_food.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # def update
    #   if @order_food.update(order_food_params)
    #     render json: @order_food
    #   else
    #     render json: { errors: @order_food.errors.full_messages }, status: :unprocessable_entity
    #   end
    # end
  
    # def destroy
    #   @order_food.destroy
    #   render json: { message: "Order deleted Successfully "}
    # end
  
    private
  
    def set_order_food
      @order_food = OrderFood.find(params[:id])
    end
  
    def order_food_params
      params.require(:order_food).permit(:food_id, :order_id)
    end
  end
  