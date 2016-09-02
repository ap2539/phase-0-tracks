#Item_list class

#intialize method
#INPUT: db connection
#STEPS: select item table and store it = Instance array
#OUTPUT: none

#view_list method
#INPUT: none
#STEPS: for each array in item_list
	#STEPS: for each index in the array
		#STEPS: Print the item# item description and price for the user
#OUTPUT: Single string with nicely formatted item list

#validate_item method
#INPUT: item_id as Integer
#STEPS: for each hash in the array 
	#STEPS: check if the the ID matches any of the items
	#STEPS: If there is a match return true
#STEPS: if the array search completes with no matches return false
#OUTPUT: BOOLEAN

#insert_item method
#INPUT: item name as string, and price as demical
#STEPS: Use the instance database to excute an insert with name and price
#STEPS: Reload the item_list instance variable
#OUTPUT: None

#get_price method
#INPUT: item id as Integer
#STEPS: for each hash in the item list array
	#STEPS: if the item ID macthes return the item price
#OUTPUT: item price as a decimal or false if item not found

#get_item method
#INPUT: item id as Integer
#STEPS: for each hash in the item list array
	#STEPS: if the item ID macthes return the item name
#OUTPUT: item name as a string or false if item not found

require 'sqlite3'

class Item_list
	def initialize(db)
		#Expected to be an array of hashes
		@db = db
		@item_list = db.execute("SELECT * FROM Items")
	end

	def view_list()
		view_list_string = ""
		@item_list.each do |item|
			view_list_string += "\##{item["id"]} - #{item["item"]} - \$#{item["price"]}\n"
		end
		return view_list_string
	end

	#search the current array list and if the item id exists return true
	#else return false 
	def validate_item(item_id)
		@item_list.each do |item|
			return true if (item["id"] == item_id)
		end
		return false
	end

	def add_item(item_name, price)
		@db.execute("INSERT INTO Items VALUES(null,?,?)", [item_name, price])
		#reload the lcurrent item list
		@item_list = @db.execute("SELECT * FROM Items")
	end

	def get_price(item_id)
		@item_list.each do |item|
			return item["price"] if (item["id"] == item_id)
		end
		return false
	end

	def get_item(item_id)
		@item_list.each do |item|
			return item["item"] if (item["id"] == item_id)
		end
		return false
	end
end

#<------- Driver Test Code ------->
#db = SQLite3::Database.new("store.db")
#db.results_as_hash = true
#new_item_list = Item_list.new(db)
#new_item_list.add_item("Headphones", 19.99)
#puts (new_item_list.view_list())
#puts new_item_list.get_item(9)