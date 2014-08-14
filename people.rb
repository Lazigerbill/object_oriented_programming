# Exercise 1 Class time

class Student < People
	def learn
		"I get it"
	end	
end

class Instructor < People
	def teach
		"Everything in Ruby is an object"
	end
end

class People
	def initialize (name)	
		@name = name
	end
end