# The following codes are the execution lines for the program, which requires the other two ruby files listed below.

require_relative 'CheckOut.rb'
require_relative 'ShopBasket.rb'

#shopper Bill came into the shop
bill=ShopBasket.new

#Let's start putting things into basket#
bill.shop

#Let's proceed to check out#
customer_1=CheckOut.new(bill.shopping_basket)
customer_1.cal_tax
customer_1.print_reciept


