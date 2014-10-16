#Putting things into your shopping basket#

class ShopBasket
	
	def initialize (shopping_basket=nil)
		@shopping_basket=shopping_basket
	end

	attr_reader (:shopping_basket)

	def user_input
		puts "What can I get you?"
		item=gets.chomp.capitalize
		puts "Price:"
		price=gets.chomp.to_f
		puts "Imported?(y/n)"
		i_tax_status=gets.chomp.upcase
		puts "Sales tax applies?(y/n)"
		s_tax_status=gets.chomp.upcase
		puts "Would you like add another item?(y/n)"
		item_profile={}
		item_profile.store(:price,price)
		item_profile.store(:s_tax,s_tax_status)
		item_profile.store(:i_tax,i_tax_status)
		@add={}
		@add.store(item,item_profile)
	end

	def shop
		@shopping_basket={}
		continue="Y"
		until continue=="N"
			user_input
			@shopping_basket.merge!(@add)
			continue=gets.chomp.upcase
		end		
		puts "Here is what you have in your shopping basket so far:"
		@shopping_basket.each do |key, value|
			puts "#{key} --------> $#{value[:price].to_f.round(2)}"
		end
		
	end
end