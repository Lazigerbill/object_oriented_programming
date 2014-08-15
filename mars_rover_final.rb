class DefineMap
	def initialize (map_x=0,map_y=0)
		@map_x=map_x
		@map_y=map_y
		# @x_occupied = []
		# @y_occupied = []
	end
		attr_reader :map_x, :map_y 

	def define
		puts "Please specify grid size by entering:"
		puts "\"x\" coordinates: "
		@map_x=gets.chomp.to_i	
		puts "\"y\" coordinates: "
		@map_y=gets.chomp.to_i	
		puts "Your defined search grid is (#{@map_x},#{@map_y})"
	end

end

class Rover 
	def initialize (init_x=0,init_y=0,init_dir="N")
		@init_x=init_x
		@init_y=init_y
		@init_dir=init_dir
	end
	attr_reader :init_x, :init_y, :init_dir
	def start
		puts "Where would you like to place your droid?"
		puts "\"x\" coordinates: "
		@init_x=gets.chomp.to_i
		puts "\"y\" coordinates: "
		@init_y=gets.chomp.to_i
		puts "Droid's facing direction: "
		@init_dir=gets.chomp
		until @init_dir=="N"||@init_dir=="E"||@init_dir=="S"||@init_dir=="W"
			puts "Invalid direction entry, please re-enter:"
			@init_dir=gets.chomp
		end
	end

	def where_am_i
		puts "Rover is now at (#{@init_x}, #{@init_y}, #{@init_dir})"
		#puts "Your defined search grid is (#{map_x},#{map_y})"
	end
end
class Motion <Rover
	def initialize (init_x, init_y, init_dir, user_input=nil,fin_x=0, fin_y=0)
		super(init_x ,init_y, init_dir)
		@user_input=user_input
		@fin_x=fin_x
		@fin_y=fin_y
		
	end
	attr_accessor :fin_y, :fin_x
	def process_input (user_input=nil)
		puts "Please enter your commands"
		puts "PLEASE NOTE that only \"L\" \"R\" \"M\" commands will be executed"
		@user_input=gets.chomp.upcase.split(//)
		@user_input.delete_if {|i| i!="L"&&i!="R"&&i!="M"}
		puts "Executable commands: #{@user_input}"
	end

	def execute (init_x,init_y,init_dir)
		dir_array=["N","E","S","W"]
		steer_wheel_count=dir_array.index(@init_dir)
		@user_input.each do |step|
			case step
				when "L"
					steer_wheel_count=(steer_wheel_count-1)%4 
				when "R"
					steer_wheel_count=(steer_wheel_count+1)%4	
				when "M"
					case steer_wheel_count
						when 0
							@init_y+=1
						when 1
							@init_x+=1
						when 2
							@init_y-=1
						when 3	
							@init_x-=1
					end
			end


		end

		puts "Destination arrived! (#{@init_x}, #{@init_y}, #{dir_array[steer_wheel_count]})"
		@fin_x=@init_x
		@fin_y=@init_y
	end
		


end

mars=DefineMap.new
mars.define
rover1=Rover.new
rover1.start
#START POINT VALIDATION to make sure rover is within pre-determined grid#
until mars.map_x>=rover1.init_x && mars.map_y>=rover1.init_y 
puts "Your droid MUST be located within pre-determined grid"
puts "Your defined search grid is (#{mars.map_x},#{mars.map_y})"	
puts "Please re-enter!"
rover1.start
end
rover1.where_am_i

#COMMAND to move rover#
#puts rover1.init_dir,rover1.init_y,rover1.init_x
rov_act=Motion.new(rover1.init_x,rover1.init_y,rover1.init_dir)
rov_act.process_input
rov_act.execute(@init_x,@init_y,@init_dir)

