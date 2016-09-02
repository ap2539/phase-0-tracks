require 'sqlite3'
require_relative 'customer.rb'
require_relative 'cart.rb'
require_relative 'item_list.rb'

def register(customer)

		puts "Please enter a user name"
		username = gets.chomp
		
		#validate if the user_name account is already used
		until !customer.validate_user(username)
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

#create the database connection to pass to objects
db = SQLite3::Database.new("store.db")
db.results_as_hash = true

customer = Customer.new(db)


puts "If you are a returning user please enter your User Name"
puts "If you would like to create an account type 'register'"
user_input = gets.chomp
login = customer.log_in(user_input)

until login
	if user_input.downcase == "register"
		login = register(customer)
	else
		puts "Invalid user name. Please try again."
		user_input = gets.chomp
		login = customer.log_in(user_input)
	end
end

puts customer.print_history()
puts "Please select an order \# or type 'start' to begin a new order"
user_input = gets.chomp

if user_input.downcase == 'start'
	customer.set_order(user_input)
	puts "Starting new order: \##{customer.current_order}"
elsif customer.set_order(user_input.to_i) == false
	puts "Order not found. Start new order: \##{customer.current_order}"
else
	puts "Order found. Pulling up information for order \##{customer.current_order}" 
end






