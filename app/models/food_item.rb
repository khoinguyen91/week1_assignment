	class FoodItem < ActiveRecord::Base
		has_many :orders, dependent: :destroy
	validates :name, presence: true,
                    length: { minimum: 5 }
   # attr_accessible :cuisine
   # acts_as_taggable
  # is_impressionable
  # for index
    # Cuisine:
    #      <% food_item.cuisines.any? %>
    #       <% food_item.cuisines.each do |cuisines| %>
    #       <span class="label label-info">
    #         <%= link_to cuisines.name, cuisine_path(cuisine.name) %>
    #       </span> 
    #       <% end %> 
	def img_url_or_default
		if img_url.present?
			img_url
		else
			"http://loremflickr.com/320/240/#{CGI.escape name}"
		end
	end
	def self.by_section(section)
		where(section: section)
	end
	# def self.sortaz(name)
	# 	order('name DESC')
	# end
	def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("name LIKE ? ", "%#{query}%")
  end
end
