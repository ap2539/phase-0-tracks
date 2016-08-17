class Puppy

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(speak_times)
  	speak_times.times do |speak|
		puts "Woof!"  		
  	end
  end

end

pixel = Puppy.new
pixel.fetch("ball")

pixel.speak(2)

