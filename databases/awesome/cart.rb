require 'sqlite3'
require_relative 'customer.rb'

#initialize method
#INPUT: db connection, customer ojbect
#STEPS: user customer object to get customer id
#STEPS: input customer id into SQL select statment to pull order history
#STEPS: load order history to instance variable
#STEPS: intialize current cart to nil

#print_history()

class Cart
	def initialize (db,customer)
		@customer_id = customer.cust_id
		@customer_name = customer.cust_name
		@db = db
	end

end

#db = SQLite3::Database.new("store.db")
#db.results_as_hash = true
#user = Customer.new(db)
#user.log_in("ap2539")
#customer_cart = Cart.new(db,user)
