# INPUT:
# The first line of input is the upper-right coordinates of the plateau, the lower-left coordinates are assumed to be 0,0.
 
# The rest of the input is information pertaining to the rovers that have been deployed. Each rover has two lines of input. 
# The first line gives the rover's position, and the second line is a series of instructions telling the rover how to explore the plateau.
 
# The position is made up of two integers and a letter separated by spaces, corresponding to the x and y co-ordinates and the rover's orientation.
 
# Each rover will be finished sequentially, which means that the second rover won't start to move until the first one has finished moving.
 
 
# OUTPUT
# The output for each rover should be its final co-ordinates and heading.
 
# INPUT AND OUTPUT
 
# Test Input:
# 5 5
# 1 2 N
# LMLMLMLMM
# 3 3 E
# MMRMMRMRRM
 
# Expected Output:
# 1 3 N
# 5 1 E

class DefineMap
	def initialize (map_x,map_y)
		@map_x=map_x
		@map_y=map_y
		# @x_occupied = []
		# @y_occupied = []
	end

	def define
		puts "Please specify grid size by entering:"
		puts "\"x\" coordinates: "
		@map_x=gets.chomp	
		puts "\"y\" coordinates: "
		@map_y=gets.chomp
		puts "Your defined search grid is (#{@map_x},#{@map_y})"
	end


end

class Rover < DefineMap
	def initialize (init_x,init_y,init_dir)
		@init_x=init_x
		@init_y=init_y
		@init_dir=init_dir
	end
	def place
		puts "Where would you like to place your droid?"
		puts "\"x\" coordinates: "
		@init_x=gets.chomp
		puts "\"y\" coordinates: "
		@init_y=gets.chomp
		puts "Droid's facing direction: "
		@init_dir=gets.chomp
	end

	def loc_check 
		until @@map_x.to_i>=@init_x.to_i && @@map_y.to_i>=@init_y.to_i && (@init_dir=="N"||@init_dir=="E"||@init_dir=="S"||@init_dir=="W")
		puts "Your droid MUST be located within pre-determined grid"
		puts "Your defined search grid is (#{@@map_x},#{@@map_y})"	
		puts "Please re-enter!"
		place
		end

	end
	def where_am_i
		puts "Droid is now at (#{@init_x}, #{@init_y}, #{@init_dir})"
	end

end






#exection part#
map=DefineMap.new(0,0)
map.define

rover1=Rover.new(0,0,"N")
rover1.place
rover1.loc_check
rover1.where_am_i

# map = Map.new(5,5)
# droid1 = Droid.new(map,2,2,'E')
# # here, we need to verify the second droid can be placed on the same map
# droid2 = Droid.new(map,1,4,'W')
# # before each move, we need to verify the move is possible on the map (either boundary reached or another rover is occupying)
# droid1.move('RRLM')
# droid1.show


















