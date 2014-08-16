

class CheckOut 
	def	initialize(checkout_basket)
	@checkout_basket=checkout_basket
	end
	attr_accessor (:checkout_basket)
	def cal_tax
		@i_tax=0
		@s_tax=0
		@checkout_basket.each do |key, value|
			if value[:i_tax]=="Y"
				value.store(:i_tax,(value[:price]*0.05*20).ceil/20.round(2))
				@i_tax+=value[:i_tax]
			else 
				value.store(:i_tax,0)
			end 
			if value[:s_tax]=="Y"
				value.store(:s_tax,(value[:price]*0.1*20).ceil/20.round(2))
				@s_tax+=value[:s_tax]
			else 
				value.store(:s_tax,0)
			end
		end
	end

	def print_reciept 
		puts "Thank you for shoping at Come-again super store!"
		puts "You have purchased:"
		grand_total=0
		@checkout_basket.each do |key, value|
			value.store(:sum, value[:price]+value[:s_tax]+value[:i_tax])
			grand_total+=value[:sum]
			puts "#{key} : $#{value[:sum].round(2)}"
		end
		puts "Sales Taxes : $#{((@i_tax+@s_tax)*20).round/20.round(2)}"
		puts "Total : $#{grand_total.round(2)}"
		
	end



end