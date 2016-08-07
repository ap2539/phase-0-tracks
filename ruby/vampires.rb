#Methond Section_______________________________________________________________________________________________________________________

def get_input(prompt)
	puts prompt
	gets.chomp
end

def is_vampire(name, age, byear, gbread, hinsure)
	#calculate the age based on year provided (Improve by using system date rather than hard coding)
	calc_age = 2016-byear
	
	#set the results variable to blank so it can be compared at end of the conditions to see if it was modified
	result = ""

	#No if else used so that every condition is evaluated
	if calc_age==age && gbread && hinsure
		result = "Probably not a vampire."
	end

	if calc_age!=age && ( !gbread || !hinsure)
		result = "Probably a vampire"
	end

	if calc_age!=age && !gbread && !hinsure
		result = "Almost certainly a vampire."
	end

	if name.upcase=="DRAKE CULA" || name.upcase=="TU FANG"
		result = "Definitely a vampire."
	end
	
	if result == ""
		result = "Results inconclusive"
	end

	return result
end

#Collect User Input Section_________________________________________________________________________________________________________________
emp_count = get_input("How many employees will be processed?").to_i
	#validates if response is a number
	until emp_count > 0
		emp_count = get_input("Invalid number. How many employees will be processed?").to_i
	end
#intialize counter for employee processing loop
i = 0

until i >= emp_count
	name = get_input("What is your name?")

	age = get_input("How old are you?").to_i
		#validates if response is a number
		until age > 0
			age = get_input("Invalid number. How old are you?").to_i
		end

	byear = get_input("What year were you born?").to_i
		#Validates if response is a number
		until byear > 0
		byear = get_input("Invalid number. What year were you born?").to_i
		end

	gbread = get_input("Our company cafeteria serves garlic bread. Should we order some for you?")
		#Validate the user entered "yes" or "no"
		until gbread.upcase == "YES" || gbread.upcase == "NO"
			gbread = get_input("Invalid Response. Our company cafeteria serves garlic bread. Should we order some for you? (yes/no)")
		end

		#translate user response from string to a boolean
		if gbread.upcase == 'YES'
			gbread = true
		else
			gbread = false
		end
	hinsure = get_input("Would you like to enroll in the company’s health insurance?")
		#Validate the user entered "yes" or "no"
		until hinsure.upcase == "YES" || hinsure.upcase == "NO"
			hinsure = get_input("Invalid Response. Would you like to enroll in the company’s health insurance? (yes/no)")
		end

		#translate user response from string to a boolean
		if hinsure.upcase == 'YES'
			hinsure = true
		else
			hinsure = false
		end

	allergy = get_input("Please list any known allergies or done if no allergies:")
	early_result = nil
	#check if employee is allergic to sunshine and process as an early result
	until allergy.upcase == "DONE" || early_result != nil
		if allergy.upcase == "SUNSHINE"
			early_result = "Definitely a vampire!"
		else
			allergy = get_input("Please enter next allergy or done to finish:")
		end
	end

#Print Section______________________________________________________________________________________________________________________________

	#process early result variable, early results should be immediately notified to the user skipping normal processing
	if early_result != nil
		p "Definitely a vampire!"

	else
		p "Determing level of Vampiry-ness...."
			#Add sleep timers to give user the oppurtunity read prompts
			sleep(3)
		p is_vampire(name, age, byear, gbread, hinsure)
			sleep(3)
	end
	i+=1
	#Give user notice that they have moved on to the next employee to process
	if i < emp_count
		puts ("Enter information for next employee.")
	end
end #End of employee processing loop

p "Actually, never mind! What do these questions have to do with anything? Let's all be friends."
