#prompt user for data input and store in variable
#translate data input to proper data type
#create hash with values stored in user input variables
#print hash
#ask user if change is needed and store response as key value to update
	#if ckey value is entered then ask user for new value and store in variable
	#check if the key is an integer value 
		#translate key to symbol and pair with new value integer into the hash
	#check is the key value is a boolean
		#translate to key to symbol and pair with boolen to the hash
	#all other cases should translate the key value to a symbol and store the new value into the hash as a string
#print the hash

#method to print a prompt for the user and return user feed back
def get_input(prompt)
	print prompt
	gets.chomp
end

#gather user data
name = get_input("Name: ")
address = get_input("Address: ")
email = get_input("Email: ")
age = get_input("Age: ").to_i
number_of_children = get_input("Number_of_children: ").to_i
likes_chevrons = get_input("likes chevrons: ")
	#translate user input to boolen
	if likes_chevrons.upcase == "NO" || likes_chevrons == "FALSE"
		likes_chevrons = false
	else
		likes_chevrons = true
	end
decor_theme = get_input("Decor Theme: ")

#Print individual variable results for testing
#p name
#p address
#p email
#p age
#p num_child
#p likes_chevrons
#p decor

# create hash
client = {
	name: name,
	address: address,
	email: email,
	age: age,
	number_of_children: number_of_children,
	likes_chevrons: likes_chevrons,
	decor_theme: decor_theme
}

#print hash for user
p client

#ask user if they need to make changes
modify_hash = get_input("Which key would you like to modify? If not, type none: ")
	#check if user has no changes if no changes then do nothing and continue
	if modify_hash.upcase != "NONE"
		new_value = get_input("What is the new value?")
		
		#check for integer keys
		if modify_hash.upcase == "AGE" || modify_hash.upcase == "NUMBER_OF_CHILDREN"
				client[modify_hash.to_sym] = new_value.to_i

		#check for boolean keys and translate to boolean
		elsif modify_hash.upcase == "LIKES_CHEVRONS"
				if new_value.upcase == "NO" || new_value.upcase == "FALSE"
					client[modify_hash.to_sym] = false
				else
					client[modify_hash.to_sym] = true
				end
		#store all other values as strings
		else
				client[modify_hash.to_sym] = new_value
		end
	end

p client
