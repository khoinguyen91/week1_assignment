class CreateFoodItems < ActiveRecord::Migration
  def change
    create_table :food_items do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :section
      t.string :img_url
      t.integer :count_view, :default => 0
      t.string :cuisine

      t.timestamps null: false
    end
  end
end
