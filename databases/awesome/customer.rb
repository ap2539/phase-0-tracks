#Visible Class Methods ----------------------->
#Initialize method
#INPUT: DB class
#STEPS: set DB to an instance variable
#STEPS: initialize instance variable for customer to nil

#validate_customer method
#INPUT: username as a string
#STEPS: pull user data from DB and set to customer
#STEPS: validate if the user name returned any data
#STEPS: return true if the provide user name is = to the returned user name
#STEPS: load the user
#STEPS: return false of there is no match
#OUTPUT: boolean

#insert_user method
#INPUT: user first name as string, user last name as string, username as string
#STEPS: execute SQL query to insert first name, last name and username into DB
#STEPS: load the user data into the object
#OUTPUT: none

#PRIVATE METHODS ----------------------->
#load_user method
#INPUT: username as string
#STEPS: for each item in the @customer array
	#STEPS:load the customer id
	#STEPS:load the customer name
#OUTPUT: none

require 'sqlite3'

class Customer
	attr_reader :cust_id, :cust_name, :cart_history, :current_order

	def initialize(db)
		@db = db
		@customer = nil
		@current_order = "null"
	end

	def log_in(username)
		customer = @db.execute("SELECT * FROM Customers where cust_username = ? " , [username])
		customer.each do |cust|
			if (cust["cust_username"] == username)
				@customer = @db.execute("SELECT * FROM Customers where cust_username = ? " , [username])
				load_user()
				return true
			end
		end
		return false
	end

	def insert_customer(first_name,last_name,username)
		@db.execute("INSERT INTO Customers VALUES (null, ?, ?, ?)", [first_name, last_name, username])
		@customer = @db.execute("SELECT * FROM Customers where cust_username = ? " , [username])
		load_user()

		return true if (validate_user(username))
		return false
	end

	def print_history()
		output_history = "#{@cust_name}'s Order History:\n"
		if @cart_history.size > 0
			@cart_history.each do |order|
				output_history += "Order\# #{order["id"]}\n"
			end
		else
			output_history += "\n You have no orders"
		end

		return output_history
	end

	def set_order(order_id)
		@cart_history.each do |order|
			if order["id"] == order_id
				@current_order = order_id
				return true
			end
		end

		#insert new order
		@db.execute("INSERT INTO Orders VALUES (null, ?)", [@cust_id])
		
		#find order id of new order
		latest_order = @db.execute("SELECT max(id) FROM Orders where cust_id = ?", [@cust_id])

		#The query returns a hash within an array, pull the data out and save to current order
		@current_order = latest_order[0][0]

		#update the users order history
		update_history()
		return false
	end

	private
	def load_user()
		@customer.each do |cust|
			@cust_id = cust["id"]
			@cust_name = "#{cust["cust_first_name"]} #{cust["cust_last_name"]}"
		end
		update_history()
	end

	def update_history()
		@cart_history = @db.execute("SELECT id FROM Orders where cust_id = ? " , [@cust_id])
	end
end

#<------- Driver Test Code ------->
db = SQLite3::Database.new("store.db")
db.results_as_hash = true
user = Customer.new(db)
#user.insert_customertomer("John", "Smith", "js1234")
puts user.log_in("adp2539")
#puts user.cust_id
#puts user.cust_name
#puts user.print_history
#puts user.set_order(10)
#puts user.current_order
#puts user.print_history