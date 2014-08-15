# # Exercise 3: Sales Taxes (Challenge)

# # Basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical products that are exempt. 
# Import duty is an additional sales tax applicable on all imported goods at a rate of 5%, with no exemptions.

# # When I purchase items I receive a receipt which lists the name of all the items and their price (including tax), 
# finishing with the total cost of the items, and the total amounts of sales taxes paid. 
# The rounding rules for sales tax are that for a tax rate of n%, a shelf price of p contains (np/100 rounded up to the nearest 0.05) amount of sales tax.

# # Write an application that prints out the receipt details for these shopping baskets...

class ShopBasket
	def initialize (item=nil, price=0, s_tax_status=nil, i_tax_status=nil)
		@item=item
		@price=price
		@s_tax=s_tax_status
		@i_tax=i_tax_status
	end
	attr_reader (:add_basket)

	def start_shopping
		puts "What can I get you?"
		@item=gets.chomp
		puts "Price:"
		@price=gets.chomp
		puts "Imported?(y/n)"
		@i_tax_status=gets.chomp.upcase
		puts "Tax exempt?(y/n)"
		@s_tax_status=gets.chomp.upcase
		puts "Would you like add another item?(y/n)"

	end

	def add_item
		item_profile={}
		item_profile.store(:price,@price)
		item_profile.store(:s_tax, @s_tax_status)
		item_profile.store(:i_tax, @i_tax_status)
		@add_basket={}
		@add_basket.store(@item,item_profile)
	end

end
class CheckOut
	def	initialize
	end
	attr_accessor (:my_basket)
	def summary
		my_basket.each do |key, value|
			puts "#{key} --------> $#{value[:price].to_f.round(2)}"
		end
	end
end

my_basket={}
bill=ShopBasket.new
#Let's start putting things into basket#
continue="Y"
until continue=="N"
bill.start_shopping
bill.add_item
my_basket.merge!(bill.add_basket)
continue=gets.chomp.upcase
end
#Summerize items in basket#
# my_basket.each do |key, value|
# 	puts "#{key} --------> $#{value[:price].to_f.round(2)}"
# end
done=CheckOut.new
done.summary



