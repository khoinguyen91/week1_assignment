class OrdersController < ApplicationController
 	before_action :set_order, only: [:show]
	def new
		@food_item = FoodItem.find params[:food_item_id]
	end
	def create
		@food_item = FoodItem.find params[:food_item_id]

		@order = Order.new(order_params)
		@order.food_item = @food_item

		if @order.save
			flash[:success] = "Order submitted. Thanks for Using Khoi's Restaurant service"
			redirect_to order_path(@order)
		else
			flash[:error] = "Error: #{@order.errors.full_messages.to_sentence}"
			render 'new'
		end
	end
	def show
		
  	end

	private
	def order_params
		params.require(:order).permit(:name, :phone_number, :address)
	end
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end
end

