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
    if params[:sort_a_z]
      @food_items = FoodItem.order(name: :asc)
    end
    if params[:sort_z_a]
      @food_items = FoodItem.order(name: :desc)
    end
    if params[:high_low]
      @food_items = FoodItem.order(price: :desc)
    end
    if params[:low_high]
      @food_items = FoodItem.order(price: :asc)
    end
    if params[:most_viewed]
      @food_items = FoodItem.order(count_view: :desc)
    end
  end
end
