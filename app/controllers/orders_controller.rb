class OrdersController < ApplicationController
	def new
		@food_item = FoodItem.find params[:food_item_id]
	end
	def create
		@food_item = FoodItem.find params[:food_item_id]

		@order = Order.new(order_params)
		@order.food_item = @food_item

		if @order.save
			flash[:success] = "Order submitted. Thanks for Using Khoi's Restaurant service"
			redirect_to menu_path
		else
			flash[:error] = "Error: #{@order.errors.full_messages.to_sentence}"
			render 'new'
		end
	end
	private
	def order_params
		params.require(:order).permit(:name, :phone_number, :address)
	end
end

