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
likes_chevrons = get_input("likes_chevrons: ")
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




