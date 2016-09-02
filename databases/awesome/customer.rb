#Initialize method
#INPUT: DB class
#STEPS: set DB to an instance variable
#STEPS: initialize instance variable for customer to nil

#validate_user method
#INPUT: username as a string
#STEPS: pull user data from DB and set to customer
#STEPS: validate if the user name returned any data
#STEPS: return true if the provide user name is = to the returned user name
#STEPS: return false of there is no match
#OUTPUT: boolean

#load_user method
#INPUT: username as string
#

require 'sqlite3'

class Customer
	attr_reader :cust_id, :cust_name

	def initialize(db)
		@db = db
		@customer = nil
	end

	def load_user(username)
		customer = @db.execute("SELECT * FROM Customers where cust_username = ? " , [username])
		customer.each do |cust|
			if (cust["cust_username"] == username)
				@customer = customer
				@customer.each do |cust|
					@cust_id = cust["id"]
					@cust_name = "#{cust["cust_first_name"]} #{cust["cust_last_name"]}"
				end
				return true
			end
		end
		return false
	end


end

db = SQLite3::Database.new("store.db")
db.results_as_hash = true
user = Customer.new(db)
puts user.load_user("ap2539")
puts user.cust_id
puts user.cust_name