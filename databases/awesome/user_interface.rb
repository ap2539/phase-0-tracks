require 'sqlite3'
require_relative 'customer.rb'
require_relative 'cart.rb'
require_relative 'item_list.rb'

def register(customer)

		puts "Please enter a user name"
		username = gets.chomp
		
		#validate if the user_name account is already used
		until !customer.valid_user(username)
			puts "Please select a different user account"
			username = gets.chomp
		end

		puts "Enter first name"
		first_name = gets.chomp

		puts "Enter last name"
		last_name = gets.chomp

		if !customer.insert_customer(first_name, last_name, username)
			puts "Soemthing went wrong"
		else
			login = true
		end

end

def start_order(customer)
	puts customer.print_history()
	puts "Please select an order \# or type 'start' to begin a new order"
	user_input = gets.chomp
	created_order = false
	if user_input.downcase == 'start'
		customer.set_order(user_input)
		puts "Starting new order: \##{customer.current_order}"
		created_order = true
	elsif customer.set_order(user_input.to_i) == false
		puts "Order not found. Start new order: \##{customer.current_order}"
		created_order = true
	else
		puts "Order found. Pulling up information for order \##{customer.current_order}" 
		created_order = true
	end

	return created_order
end

def log_in_attempt(customer)
	user_input = gets.chomp
	login = customer.log_in(user_input)
	if user_input.downcase == "register"
		login = register(customer)
	elsif login == true

	else
		puts "Invalid user name. Please try again."
		user_input = gets.chomp
		login = customer.log_in(user_input)
	end

	return login
end

def add_item(db,cart)
	item_list = Item_list.new(db)
	puts item_list.view_list()
	puts "Select the number of the item you wish to add"
	user_input = gets.chomp.to_i
	
	until item_list.validate_item(user_input) && !cart.in_cart(user_input)
		puts item_list.view_list()
		puts "Item already in cart or invalid item.\nPlease select again"
		user_input = gets.chomp.to_i
	end

	item_to_add = user_input
	puts "How many would you like?"
	user_input = gets.chomp.to_i

	until user_input >0
		puts "Invalid input, please enter a valid number"
		user_input = gets.chomp.to_i
	end

	qty_to_add = user_input

	cart.add_to_cart(item_to_add,qty_to_add)

	puts "succesfully added"
end


#create the database connection to pass to objects
db = SQLite3::Database.new("store.db")
db.results_as_hash = true

customer = Customer.new(db)


puts "If you are a returning user please enter your User Name"
puts "If you would like to create an account type 'register'"

login = false
until login
	login = log_in_attempt(customer)
end

order_created = false
until order_created
	order_created = start_order(customer)
end


user_is_done = false

cart = Cart.new(db, customer)
	puts cart.print_cart()

until user_is_done
	
	

	puts "\n\tWhat would you like to do?"
	puts "\t1 - Add to cart"
	puts "\t2 - Change cart"
	puts "\t3 - Check out"
	user_input = gets.chomp.to_i


	case 
		when user_input == 1
			add_item(db,cart)
			puts cart.print_cart()
		when user_input == 2
			start_order(customer)
			cart = Cart.new(db, customer)
			puts cart.print_cart()
		when user_input == 3
			puts "THANKS FOR SHOPPING WITH US!!"
			puts "Here is your submitted order"
			puts cart.print_cart()
			user_is_done = true
		else
			puts "Invaid Input, please enter 1-3"
	end

end




		



