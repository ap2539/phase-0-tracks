fridge_contents = ["eggs", "beef", "soda","orange juice","milk","pizza","lobster", "pie", "chiken"]
office = {Printer: "HP", Laptop: "Mac", Computer: "Dell", Desk: "Large", Number_of_Chairs: 4, Has_Window: false, Phone: "Cisco" }

p "################ Print starting array and hash ####################"

p fridge_contents
p office

p "################ Print each array item ####################"

fridge_contents.each do |fridge_item|
	p fridge_item	
end

p "################ Print each hash item ####################"


office.each do |office_item|
	p office_item
end

p "################ Modify each array item ####################"


fridge_contents.map! do |fridge_item|
	fridge_item + "!"
end

p "################ Print current array and hash ####################"


p fridge_contents
p office

################### Assignment Break ###################

#Do the thing 1
puts ""
p "################ Delete if example - Array ####################"

fridge_contents.delete_if do |fridge_item| 
	fridge_item.length >= 10
end
p fridge_contents

p "################ Delete if example - Hash ####################"

office.delete_if do |catergory, description|
	description == false
end

p office

################### Assignment Break ###################

#Do the thing 2
puts ""
p "################ Keep if example - Array ####################"

fridge_contents.keep_if do |fridge_item| 
	fridge_item.length < 6
end
p fridge_contents

p "################ Keep if example - Hash ####################"

office.keep_if do |catergory, description|
	description.is_a? String
end

p office

################### Assignment Break ###################

#Do the thing 3
puts ""
p "################ Reject example - Array ####################"

fridge_contents = fridge_contents.reject! do |fridge_item| 
	fridge_item.length <= 4
end

p fridge_contents

p "################ Reject example - Hash ####################"

office = office.reject! do |catergory, description|
	description.length > 4
end

p office

################### Assignment Break ###################

#Do the thing 4
puts ""
p "################ Drop While example - Array ####################"

fridge_contents = fridge_contents.drop_while do |fridge_item| 
	fridge_item.include? "e"
end

p fridge_contents

p "################ Drop While example - Hash ####################"

office = office.drop_while do |catergory, description|
	description.length < 4
end

p office
