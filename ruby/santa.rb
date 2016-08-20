class Santa
	def initialize
		puts "Initializing Santa instance ..."
	end

	def speak
		puts "Ho, ho, ho! Haaaappy holidays!"
	end

	def eat_milk_and_cookies(cookie)
		puts "That was a good #{cookie}!"
	end
end

mr_clause = Santa.new
mr_clause.speak
mr_clause.eat_milk_and_cookies("chocolate chip cookie")