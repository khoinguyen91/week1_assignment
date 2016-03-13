class MenuController < ApplicationController
  def index	
  	 # @food_items = FoodItem.all
  	@sections = %w(Breakfast Lunch Dinner Drinks)
  	if params[:section]
  		@food_items = FoodItem.by_section(params[:section])	
  	else
  		@food_items = FoodItem.all
  	end
    if params[:search]
      @food_items = FoodItem.search(params[:search])
    end
    if params[:sort] == "name"
      @food_items = FoodItem.order(name: params[:order])
    end
    if params[:sort] == "price"
      @food_items = FoodItem.order(price: params[:order])
    end

    if params[:sort] == "count_view"
      @food_items = FoodItem.order(count_view: params[:order])
    end
  end
end
