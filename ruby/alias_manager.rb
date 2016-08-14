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

def get_next_vowel (vowel_letter)
	vowels = "aeiou"
	vowel_index = vowels.index(vowel_letter) + 1
	if vowel_index == 5
		vowel_index = 0
	end

	vowel_letter = vowels[vowel_index]

end

def get_next_con (consonant_letter)
	consonants = "bcdfghjklmnpqrstvwxyz"
	consonant_index = consonants.index(consonant_letter) + 1
	if consonant_index == 21
		consonant_index = 0
	end

	consonant_letter = consonants[consonant_index]

end

def check_if_vowel (letter)
	vowels = ['a','e','i','o','u']
	return vowels.include? letter
	
end


agent_name = "celeste"
agent_name_letters = agent_name.chars

agent_name_letters.each do |letter|
	if check_if_vowel(letter)
		p get_next_vowel(letter)
	else
		p get_next_con(letter)
	end
end



