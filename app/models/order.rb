class Order < ActiveRecord::Base
  belongs_to :food_item
  has_many :food_items
  validates :food_item, :name, :phone_number, :address, presence: true
end
