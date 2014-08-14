# Exercise 1 Class time


class People
	def initialize (name)	
		@name = name
	end
	def greetings
		"Hi, my name is #{@name}."
	end	
end

class Student < People
	def learn
		@name=@name+" the student"
		puts greetings + " I get it"
	end
end

class Instructor < People
	def teach
		@name=@name+" the instructor"
		puts greetings + " Everything in Ruby is an object"
	end
end


puts"What is your name?"
name=gets.chomp


input=Instructor.new (name)
input.teach
input=Student.new(name)	#Student class must be assigned before the method 'learn' can be called
input.learn


