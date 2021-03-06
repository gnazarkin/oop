class Person
	attr_accessor :name

	def initialize(name)
		@name = name
	end

	def greet
		puts "Hi, my name is #{@name}"
	end

end

class Student < Person
	def learn
		puts "I get it!"
	end
end

class Instructor < Person
	def teach 
		puts "Everything in Ruby is an Object"
	end
end

chris = Instructor.new("Chris")
christina = Student.new("Christina")

chris.teach
christina.learn
# christina.teach # won't work because the student class doesn't have the teach method"

