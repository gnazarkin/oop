class Plateau

	def initilize(x,y)
		@x = x
		@y = y
	end

end

class Rover
	attr_accessor :x, :y, :direction

	def initialize(x, y, direction)
		@x = x
		@y = y
		@direction = direction
	end

	def explore(movement)
		mov_array = movement.split("")
		mov_array.each do |command|

			if (@direction == "N" && command == "M")
			 	@y+=1 
			elsif (@direction == "E" && command == "M")
				@x+=1
			elsif (@direction == "S" && command == "M")
			 	@y-=1
			elsif (@direction == "W" && command == "M")
				@x-=1	

			elsif (command == "L" && @direction == "N")
			 	@direction = "W"
			elsif (command == "L" && @direction == "E")
				@direction = "N"
			elsif (command == "L" && @direction == "S")
			  @direction = "E"
			elsif (command == "L" && @direction == "W")
			 @direction = "S"
			
			elsif (command == "R" && @direction == "N")
			 @direction = "E"
			elsif (command == "R" && @direction == "E")
			 @direction = "S"
			elsif (command == "R" && @direction == "S")
			 @direction = "W"
			elsif (command == "R" && @direction == "W")
			 @direction = "N"
			end
		end

	end
end

rover1 = Rover.new(1,2,"N")
rover1.explore("LMLMLMLMM")

rover2 = Rover.new(3,3,"E")
rover2.explore("MMRMMRMRRM")

puts "#{rover1.x} #{rover1.y} #{rover1.direction}"
puts "#{rover2.x} #{rover2.y} #{rover2.direction}"
