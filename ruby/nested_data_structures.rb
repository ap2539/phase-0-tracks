
festival = {
	#catergory 1
	food_stands: 
		[	
			#food stand 1
			{
				Name: 'Fremont Burgers',
				Menu: 
				[
					'Cheese Burger',
					'Western Burger',
					'Lamb Burger'
				],
				loc_num: 12
			},
			#food stand 2
			{
				Name: 'Green Wood Cheese Steaks',
				Menu: 
				[
					'Cheese Steak',
					'Chicken Sandwich',
					'Suprise Steak'
				],
				loc_num: 13
			}
		],
	
	#catergory 2
	entertainment_stages: 
	[
		#act 1
		{
				act_name: 'Adele',
				performance_times: 
				[
					'3PM',
					'5PM',
					'8PM'
				],
		},

		#act 2
		{
				act_name: 'Drake',
				performance_times: 
				[
					'10PM'
				],
		}
	]
}

#Select the food stand hash and print all of the 
festival[:food_stands].each do |food_stand| 
	puts "#{food_stand[:Name]}"
	
	food_stand[:Menu].each do |menu_item|
		print " - #{menu_item} \n"
	end
end

#Select performance times for west stage
p festival[:entertainment_stages][0][:performance_times]
