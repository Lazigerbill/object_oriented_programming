require_relative 'CheckOut.rb'
require_relative 'ShopBasket.rb'

#####Input 1
# my_basket={
# 	"Book"=>{
# 		:price=>12.49,
# 		:i_tax=>"N",
# 		:s_tax=>"N"
# 	},
# 	"Music CD"=>{
# 		:price=>14.99,
# 		:i_tax=>"N",
# 		:s_tax=>"Y"
# 	},
# 	"Chocolate bar"=>{
# 		:price=>0.85,
# 		:i_tax=>"N",
# 		:s_tax=>"N"
# 	}
# }

# ####Input 2
# my_basket={
# 	"Imported box of chocolate"=>{
# 		:price=>10.00,
# 		:i_tax=>"Y",
# 		:s_tax=>"N"
# 	},
# 	"Imported bottle of purfume"=>{
# 		:price=>47.50,
# 		:i_tax=>"Y",
# 		:s_tax=>"Y"
# 	}
# }

#####Input 3
# my_basket={
# 	"Imported perfume"=>{
# 		:price=>27.99,
# 		:i_tax=>"Y",
# 		:s_tax=>"Y"
# 	},
# 	"Perfume"=>{
# 		:price=>18.99,
# 		:i_tax=>"N",
# 		:s_tax=>"Y"
# 	},
# 	"Headache pills"=>{
# 		:price=>9.75,
# 		:i_tax=>"N",
# 		:s_tax=>"N"
# 	},
# 	"Imported chocolates"=>{
# 		:price=>11.25,
# 		:i_tax=>"Y",
# 		:s_tax=>"N"
# 	},
# }

#shopper Bill came into the shop
bill=ShopBasket.new
#Let's start putting things into basket#
bill.shop
#Let's proceed to check out#
customer_1=CheckOut.new(bill.shopping_basket)
customer_1.cal_tax
customer_1.print_reciept


