#Pokemon class
	#attr_reader :moves, :level
	#attr_accessor :pokemon name

	#Method: Intialize
	#Input: Pokemon name, moves array, level)
	#Steps: Set the pokemon name = to an instance variable
	#Steps: Set the moves array = to an instance variable
	#Steps: Set level = to an instance variable (defaults to 1)
	#Output: Print "#{Pokemon Name} I choose you!"

	#Method: Attack
	#Input: None
	#Steps: Randomly choose a number 1-4
	#Steps: Print "#{pokemon name} attacked using #{move[random number]}"
	#Output: Print data to screen

	#Method: level_up
	#Input: None
	#Steps: Add + 1 to pokemon level instance variable
	#Output: None

	#Method: Change_Move
	#Input: old move as a string, new move as a string
	#Steps: IF old_move exists in the move array delete it
	#Steps: THEN insert new move into the array
	#Steps: ELSE return false

	#Method: Display Stats
	#Input: none
	#Steps: PRINT "Pokemon name: #{pokemon_name}"
	#Steps: PRINT "Level: #{level}"
	#Steps: FOR EACH item in the moves array |i|
	#Steps: 	PRINT "Move #{i} - #{moves[i]}"
	#Output: Print to screen

class Pokemon
	attr_reader :moves, :level
	attr_accessor :pokemon_name

	def initialize (pokemon_name, moves, level)
		@pokemon_name = pokemon_name
		@moves = moves
		@level = level
		puts "#{@pokemon_name} I choose you!"
	end

	def attack
		puts "#{@pokemon_name} attacked using #{@moves[rand(4)]}!!"
	end

	def level_up
		@level += 1
	end

	def change_move(old_move,new_move)
		if @moves.include? old_move
			@moves.delete(old_move)
			@moves.push(new_move)
			return true
		else
			return false
		end
	end
	
	def display_stats
		puts "Pokemon Name: #{@pokemon_name}"
		puts "Level: #{@level}"
		i=1
		@moves.each do |move|
			puts "Move ##{i} - #{move}"
			i+=1
		end
	end
end

#name = "Pikachu"
#moves = ["Electroball", "Quick Attack", "Iron Tail", "Thunder Bolt"]
#level = 20


#pikachu = Pokemon.new(name,moves,level)

#pikachu.display_stats
#pikachu.attack
#pikachu.level_up
#pikachu.level_up
#pikachu.display_stats
#pikachu.change_move("Electroball","Thunder")
#pikachu.display_stats

pokemon_team = []
#sample moves used later to randomly assign a move to a pokemon
sample_moves = ["Quick Attack", "Tackle", "Scratch", "Growl", 
				"Leer", "Headbut", "Assist", "Boomburst", 
				"Double Team", "Flash", "Focus Energy", 
				"Double Slap", "Mega Punch", "Mean Look"]


#A pokemon trainer can only have up to 6 pokemon at any given time!!!
until pokemon_team.length >= 6
	#reset the input variables
	user_moves = []
	moves_input = ""
	user_pokemon_name = ""
	user_level = 1

	puts "Please enter Pokemon name or 'done' to finish"
	user_pokemon_name = gets.chomp
	
	#you can also break if the user types done
	break if user_pokemon_name.downcase == 'done'

	#a pokemon must have 4 moves
	until user_moves.length >= 4 || moves_input.downcase == 'random'
		puts "Please enter a pokemon move for #{user_pokemon_name}: #{4 - user_moves.length} more move(s) needed (or type 'random')"
		moves_input = gets.chomp

		#give the user the option randomly assign moves
		if moves_input.downcase == "random" && user_moves.length == 0
			4.times do 
				user_moves << sample_moves.sample
			end
		else
				user_moves << moves_input
		end
	end

	#collect the level of the pokemon
	puts "Please enter #{user_pokemon_name}'s level"
	user_level = gets.chomp.to_i

	#create pokemon and add to the pokemon team array
	pokemon_team << Pokemon.new(user_pokemon_name, user_moves, user_level)
end
	
	#print the pokemon stats after loop is done
	pokemon_team.each do |pokemon|
		pokemon.display_stats
		puts "\n"	
	end





















