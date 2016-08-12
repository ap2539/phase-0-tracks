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
num_child = get_input("Number of Children: ").to_i
likes_chevrons = get_input("Likes Chevrons? ")
	#translate user input to boolen
	if likes_chevrons.upcase == "NO"
		likes_chevrons = false
	else
		likes_chevrons = true
	end
decor = get_input("Decor Theme: ")

#Print individual variable results for testing
#p name
#p address
#p email
#p age
#p num_child
#p likes_chevrons
#p decor


