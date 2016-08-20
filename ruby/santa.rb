class Santa
	attr_reader :age, :ethnicity
	attr_accessor :gender

	def initialize (gender, ethnicity)
		puts "Initializing Santa instance ..."
		@gender = gender
		@ethnicity = ethnicity
		@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
		@age = 0
	end

	def speak
		puts "Ho, ho, ho! Haaaappy holidays!"
	end

	def eat_milk_and_cookies(cookie)
		puts "That was a good #{cookie}!"
	end

	def celebrate_birthday
		@age += 1
	end

	def get_mad_at(reindeer)
		if @reindeer_ranking.include? reindeer
			@reindeer_ranking.delete(reindeer)
			@reindeer_ranking.push(reindeer)
		else
			puts "Reindeer does not exist"
		end
	end
end

#mr_clause = Santa.new("Male", "Hispanic")
#mr_clause.speak
#mr_clause.eat_milk_and_cookies("chocolate chip cookie")
#mr_clause.get_mad_at("Rudolph")
#mr_clause.gender = "Female"
#p mr_clause.gender
#mr_clause.celebrate_birthday
#p mr_clause.age
#p mr_clause.ethnicity

#santas = []
#example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A", "male"]
#example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A", "hispanic"]
#example_genders.length.times do |i|
#  santas << Santa.new(example_genders[i], example_ethnicities[i])
#end

#intialize the arrays to be used later, populate age and ethinicty here
santas = []
genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A", "male"]
ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A", "hispanic"]

#loop to create any numer of santas
100.times do |i|

	#store the Santas in the santas array and randomly choose gender and ethnicity
	santas << Santa.new(genders.sample, ethnicities.sample)

	#Can't directly change age so celebrate the current santas birthday N times to update age
	rand(140).times do
		santas[i].celebrate_birthday
	end
	
	#print section
	puts "Santa number #{i + 1} is #{santas[i].age} years old"
	puts "Santa number #{i + 1}'s ethnicity is #{santas[i].ethnicity}"
	puts "Santa number #{i + 1}'s gender is #{santas[i].gender}"
end