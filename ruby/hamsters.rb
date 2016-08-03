puts "Whats your hamsters name?"
hname = gets.chomp

puts "How loud is your hamster? (1-10)"
loudness = gets.chomp.to_i
	#Loop until the integer is between 1 and 10
	until loudness >1 && loudness <10
		puts "Please make it 1-10."
    	loudness = gets.chomp.to_i
	end


puts "What is the fur color of your hamster?"
fcolor = gets.chomp

puts "Is your hamster adoptable?"
adopt = gets.chomp
	#Loop until the string is "yes" or "no" ignore case
	until adopt.upcase == "YES" || adopt.upcase == "NO"
		puts "Invalid Response. Is you hamster adoptable? (yes/no)"
		adopt = gets.chomp
	end

puts "How old is you hamster in months?"
age = gets.chomp
	#If blank set to nil else loop until age is a number
	if age == ""
	age = NIL
	else
		age=age.to_f
		until age.to_f > 0
			puts "Please enter a valid number. How old is you hamster in months?"
			age = gets.chomp.to_f
		end
	
	end


puts "Hamster Summary"
puts "Name: #{hname}"
puts "Loudness: #{loudness}"
puts "Fur Color: #{fcolor}"
puts "Adoptable?: #{adopt}"
	#rather than giving a blank when age is nil tell the user the age is unknown otherwise tell the user the value of age
	if age == NIL
		puts "Age: Unknown"
	else	
		puts "Age: #{age}"
	end	
