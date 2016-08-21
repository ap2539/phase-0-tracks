#module Shout
#	def self.yell_angrily(words)
#    	words + "!!!" + " :("
#  	end
#
#  	def self.yell_happily(words)
#  		words + "!!!" + " :)"
#  	end
#end
#
#p Shout.yell_happily("HAPPY WORDS")
#p Shout.yell_angrily("ANGRY WORDS")

module Shout
	def yell_angrily(words)
    	words + "!!!" + " :("
  	end

  	def yell_happily(words)
  		words + "!!!" + " :)"
  	end
end

class Referee
	include Shout
end

class Teacher
	include Shout
end

ref = Referee.new
teach = Teacher.new

p ref.yell_angrily("I will not change my call")
p ref.yell_happily("Great game")

p teach.yell_happily("Great job class")
p teach.yell_angrily("Teachers shouldn't yell in anger, this is probabaly a bad example")