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

name = "Pikachu"
moves = ["Electroball", "Quick Attack", "Iron Tail", "Thunder Bolt"]
level = 20


pikachu = Pokemon.new(name,moves,level)

pikachu.display_stats
pikachu.attack
pikachu.level_up
pikachu.level_up
pikachu.display_stats
pikachu.change_move("Electroball","Thunder")
pikachu.display_stats

