class Puppy
	def initialize
		puts "Initializing new puppy instance ..."
	end 

	def method_name
	
	end

  	def fetch(toy)
    	puts "I brought back the #{toy}!"
    	toy
  	end

  	def speak(speak_times)
  		speak_times.times do |speak|
		puts "Woof!"  		
		end
  	end

  	def roll_over
  		puts "*rolls over*"
  	end

  	def dog_years(human_years)
  		dog_years = human_years * 7  	
  	end

  	def cutness_overload
  		puts "  __      _"
  		puts "o'')}____//"
  		puts " `_/      )"
  		puts " (_(_/-(_/"
  	end
end

#create new puppy instance
pixel = Puppy.new

#play with puppy instance
pixel.fetch("ball")

#ask puppy instance to speak
pixel.speak(2)

#ask puppy instance to roll over
pixel.roll_over

#ask how old puppy instance is if you only know human years
human_years = 2
dog_years = pixel.dog_years(human_years)
puts dog_years

pixel.cutness_overload



class Pokemon
	def initialize(name)
		@pokemon_name = name
		puts "#{@pokemon_name} I choose you..."
	end 

	def attack(move)
		puts "#{@pokemon_name} used #{move} ... Its Super Effective!"
	end

	def dodge
		puts "#{@pokemon_name} dodged the attack!"
	end
end

pikachu = Pokemon.new("Pikachu")
pikachu.attack("Thunder")
pikachu.dodge

