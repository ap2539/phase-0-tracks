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

require 'sqlite3'

class Item_list
	def initialize(db)
		#Expected to be an array of hashes
		@db = db
		@item_list = db.execute("SELECT * FROM Items")
		puts "done"
	end

	def view_list()
		view_list_string = ""
		@item_list.each do |item|
			view_list_string += "\##{item["id"]} - #{item["item"]} - \$#{item["price"]}\n"
		end

		initialize(@db)


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
end

db = SQLite3::Database.new("store.db")
db.results_as_hash = true
new_item_list = Item_list.new(db)
puts (new_item_list.view_list())

puts new_item_list.validate_item(10)