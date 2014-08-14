#Motion Control
class MotionControl
	def initialize (user_input)
		@user_input=user_input
		@@init_dir="E"
		@@init_x=0
		@@init_y=0
	end

	def req_input (user_input)
		puts "Please enter your commands"
		puts "PLEASE NOTE that only \"L\" \"R\" \"M\" commands will be executed"
		user_input=gets.chomp
		@input=user_input.upcase.split(//)
		#puts @input
	end

	def input_purification
		@val_input=@input.delete_if {|i| i!="L"&&i!="R"&&i!="M"}
		puts "Executable commands: #{@val_input}"
		#puts "Executable command: #{@pur}"
				
	end

	def execute 
		dir_array=["N","E","S","W"]
		steer_wheel_count=dir_array.index(@@init_dir)
		
		@val_input.each do |step|
			case step
				when "L"
					steer_wheel_count=(steer_wheel_count-1)%4 
				when "R"
					steer_wheel_count=(steer_wheel_count+1)%4	
				when "M"
					case steer_wheel_count
						when 0
							@@init_y+=1
						when 1
							@@init_x+=1
						when 2
							@@init_y-=1
						when 3	
							@@init_x-=1
					end
			end


		end

		puts "Destination arrived! (#{@@init_x}, #{@@init_y}, #{dir_array[steer_wheel_count]})"
		@@fin_x=@@init_x
		@@fin_y=@@init_y
		@@fin_dir=dir_array[steer_wheel_count]
	end
		


end

read=MotionControl.new(0)
read.req_input(0)
read.input_purification
read.execute