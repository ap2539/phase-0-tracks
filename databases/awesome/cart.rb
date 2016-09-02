require 'sqlite3'
require_relative 'customer.rb'

#initialize method
#INPUT: db connection, customer ojbect
#STEPS: user customer object to get customer id
#STEPS: set db to instance variable
#STEPS: load cart

#Private method update_cart
#INPUT: None
#STEPS: use SQL to pull the order lines for the current order and save it to the cart
#STEPS: If the cart has items 
	#STEPS: use SQL to get the grand total of the cart and save it to the total

#Public print_cart method()
#INPUT: none
#STEPS: intialize a string to save print data to
#STEPS: check if the cart has items
	#STEPS: if no items set the string to say the cart is empty
	#STEPS: if the cart has items
		#STEPS: nicely format each order line and store it to the cart string
		#STEPS: after cycling through all the order lines add the order total to the cart string

class Cart
	
	def initialize (db,customer)
		@customer = customer
		@db = db
		update_cart()

	end

	def print_cart()
		cart_string = ""
		if @cart.size == 0
			cart_string = "#{@customer.cust_name}'s Cart is empty"
		else
			cart_string += "#{@customer.cust_name}'s Cart\n\n"
			@cart.each do |cart_line|
				cart_string += "#{cart_line["item"]} - #{cart_line["qty"]} - $#{cart_line["order_line_total"]}\n"
			end

			cart_string += "\nGRAND TOTAL: $#{@total}"
		end
	end

	private
	def update_cart()
		order_line_query = <<-SQL
			SELECT  i.item, ol.qty, sum(i.price * ol.qty) "order_line_total"
			FROM OrderLines ol, items i
			WHERE ol.item_id = i.id
			and ol.order_id = ?
			group by ol.order_line_id;
		SQL
		@cart = @db.execute(order_line_query, [@customer.current_order])

		if cart.size > 0 
			order_total_query = <<-SQL
				SELECT sum(i.price * ol.qty) "order_total"
				FROM OrderLines ol, items i
				WHERE ol.item_id = i.id
				and ol.order_id = ?
				group by ol.order_id;
			SQL

			@total = @db.execute(order_total_query, [@customer.current_order])
			@total = @total[0]["order_total"]
		end
	end

end

#<------- Driver Test Code ------->
#db = SQLite3::Database.new("store.db")
#db.results_as_hash = true
#user = Customer.new(db)
#user.log_in("ap2539")
#user.set_order(1)
#customer_cart = Cart.new(db,user)
#puts customer_cart.print_cart()
