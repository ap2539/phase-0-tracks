#Split take the current name and split it to an array with first name and an array with last name
#pass the arrays to the get chars method to split it into individual letters
	#use .chars to resave the array to an array of teh string letters
#pass the array of letters to the chnage vowels method
	#takes an array of letters 
	#create a loop to cycle through each letter
	#check if each letter is a vowel by comparing against a static array that contains all vowels
	#if the letter is a vowel
		#add 1 to the current index postition of the vowel array
		#save the current position of the vowel to the current position of the letter array
	#return the updated array
#pass the array of letters to the change consonant method
		#takes an array of letters 
	#create a loop to cycle through each letter
	#check if each letter is a vowel by comparing against a static array that contains all vowels
	#if the letter is a vowel
		#add 1 to the current index postition of the vowel array
		#save the current position of the vowel to the current position of the letter array
	#return the updated array
#print the modified name


# =============================================================================
#      Method Declarations
# =============================================================================

#checks the vowel string for matches moves the index to the next letter and returns it
def get_next_vowel (vowel_letter)
	vowels = "aeiou"
	vowel_index = vowels.index(vowel_letter) + 1
	if vowel_index == 5
		vowel_index = 0
	end

	vowel_letter = vowels[vowel_index]

end

#checks the consonant string for matches moves the index to the next letter and returns it
def get_next_con (consonant_letter)
	consonants = "bcdfghjklmnpqrstvwxyz"
	consonant_index = consonants.index(consonant_letter) + 1
	if consonant_index == 21
		consonant_index = 0
	end

	consonant_letter = consonants[consonant_index]

end

#checks if the letter is a vowel and returns true or false
def check_if_vowel (letter)
	vowels = ['a','e','i','o','u']
	return vowels.include? letter
	
end

#create an array of letters within the array to keep the names contained
def get_letters (string_array)
	new_string_array = []
	string_array.each do | str_name|
		new_string_array.push(str_name.chars)
	end
	return new_string_array
end

#condense the letter array back to string array then back to a string
def condense_array (letter_array)
	letter_array.map! do |name_letter_array|
		name_letter_array.join
	end
	letter_array.join(' ')

end

#cycles through an array of letters and changes them based on if vowel or not
def translate_letters (array_of_letters)
	array_of_letters.map! do |letter|
		if check_if_vowel(letter)
			letter = get_next_vowel(letter)
		else
			letter = get_next_con(letter)
		end
	end
end

#main logic - break down the array to letters translate letters condense the array back to letters then return a reversed split array
def get_alias (agent_name_array)
	agent_name_array = get_letters(agent_name_array.split)

	agent_name_array.map! do |agent_name|
		translate_letters(agent_name)
	end
	 condense_array(agent_name_array.reverse!)
end

#Display a message and return user input
def get_input(prompt)
	puts prompt
	gets.chomp
end

# =============================================================================
#      User Interface Code
# =============================================================================
agent_name = ""
agent_hash = {}

#gather user input and modify the agent name
#improvement possibilities
#1)modify the code to properly accept capital letters currently can not handle capital letters
#2)look into regular expressions to check if special characters are entered

until agent_name.downcase == 'quit'
	agent_name = get_input("Enter employee name? Type 'quit' to end").downcase
	agent_modified_name = get_alias(agent_name)
	if agent_name.downcase != 'quit'
		p "Tranlating #{agent_name} to #{agent_modified_name}"
		agent_hash.store(agent_name.to_sym, agent_modified_name)
	end
end

agent_hash.each do |agent_symbol, agent_modified|
	p agent_symbol.to_s + " translates to " + agent_modified	
end





