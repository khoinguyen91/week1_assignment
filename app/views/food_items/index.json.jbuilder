json.array!(@food_items) do |food_item|
  json.extract! food_item, :id, :name, :description, :price, :section, :img_url, :count_view, :cuisine
  json.url food_item_url(food_item, format: :json)
end
