#Item_list class

#intialize method
#INPUT: an array of arrays
#STEPS: set array = Instance array
#OUTPUT: none

#view_list method
#INPUT: none
#STEPS: for each array in item_list
	#STEPS: for each index in the array
		#STEPS: Print the item# item description and price for the user
#OUTPUT: Single string with nicely formatted item list

class Item_list
	def initialize(input_list)
		#Expected to be an array of hashes
		@item_list = input_list
	end

	def view_list()
		view_list_string = ""
		@item_list.each do |item|
			view_list_string += "\##{item["id"]} - #{item["item_name"]} - \$#{item["price"]}\n"
		end
		return view_list_string
	end
end
list = [{"id"=>1,"item_name"=>"Mouse", "price" => 25.99},{"id"=>2,"item_name"=>"Keyboard", "price" => 29.99}]

new_item_list = Item_list.new(list)
puts (new_item_list.view_list())