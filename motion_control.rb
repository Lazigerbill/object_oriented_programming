#Motion Control
class Motion
	def initialize (curr_dir,curr_y,curr_x, user_input=nil)
		@user_input=user_input
		@curr_dir=curr_dir
		@curr_x=curr_x
		@curr_y=curr_y
	end

	def process_input (user_input=nil)
		puts "Please enter your commands"
		puts "PLEASE NOTE that only \"L\" \"R\" \"M\" commands will be executed"
		@user_input=gets.chomp.upcase.split(//)
		@user_input.delete_if {|i| i!="L"&&i!="R"&&i!="M"}
		puts "Executable commands: #{@user_input}"
	end

	# def input_purification
	# 	@val_input=@input.delete_if {|i| i!="L"&&i!="R"&&i!="M"}
	# 	puts "Executable commands: #{@val_input}"
	# 	#puts "Executable command: #{@pur}"
				
	# end

	def execute (curr_dir,curr_y,curr_x)
		dir_array=["N","E","S","W"]
		steer_wheel_count=dir_array.index(@curr_dir)
		
		@user_input.each do |step|
			case step
				when "L"
					steer_wheel_count=(steer_wheel_count-1)%4 
				when "R"
					steer_wheel_count=(steer_wheel_count+1)%4	
				when "M"
					case steer_wheel_count
						when 0
							@curr_y+=1
						when 1
							@curr_x+=1
						when 2
							@curr_y-=1
						when 3	
							@curr_x-=1
					end
			end


		end

		puts "Destination arrived! (#{@curr_x}, #{@curr_y}, #{dir_array[steer_wheel_count]})"

	end
		


end

rov_act=Motion.new("N",0,0)
rov_act.process_input
rov_act.execute(0,0,0)