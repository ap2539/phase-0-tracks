# Virus Predictor =======================================================================

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
#Can also require gems, user created
#Look into gem repository

require_relative 'state_data'

class VirusPredictor

  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  def virus_effects
    print "#{@state} will lose #{predicted_deaths} people in this outbreak and will spread across the state in #{speed_of_spread} months.\n\n"
  end

  private

#command D to multi select teh current selection
#look for repating lines or variables to refactor
  def predicted_deaths
    # predicted deaths is solely based on population density
    
    if @population_density >= 200
      rate = 0.4
    elsif @population_density >= 150
      rate = 0.3
    elsif @population_density >= 100
      rate = 0.2
    elsif @population_density >= 50
      rate = 0.1
    else
      rate = 0.05
    end

    (@population * rate).floor

  end

  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    #speed = 0.0

    if @population_density >= 200
      0.5
    elsif @population_density >= 150
      1
    elsif @population_density >= 100
      1.5
    elsif @population_density >= 50
      2
    else
      2.5
    end
  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

#for each item in the hash - done
  #call each nested hash using static symbols - done
    #create a new virus predictor object - done
    #pass state as string - done
    #pass population density - done
    #pass population - done
    #use the object to call virus effects - done

#calling each state in STATE_DATA hash
#good to refeactor this to one line for repeated calls
STATE_DATA.each { |state, population_data| VirusPredictor.new(state,population_data[:population_density],population_data[:population]).virus_effects }


#command /
# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects



#=======================================================================
# Reflection Section
#What are the differences between the two different hash syntaxes shown in the state_data file?
  #The first hash synatx assigns a key value as a string. The second uses symbols as the key to assign int values.
  #This helps to make the code more readable and reduce memory space since a symbol has a single unique object ID for the same symbol
  #Where as a string doing the same work would have unique object ID for each occurence of the string

#What does require_relative do? How is it different from require?
  #require_relative looks locally on the for the file name called out and makes it available in the current file as if it was part of the file

#What are some ways to iterate through a hash?
  #You can use the .each method to cyle through a hash. Alternatively you could also use the .each_key or .each_value

#When refactoring virus_effects, what stood out to you about the variables, if anything?
  #The fact that it was passing instance methods stood out. This is uneeded since the instance variables are available to the class

#What concept did you most solidify in this challenge?
  #Refactoring - I have been struggling with refactoring because I have been concentrating on getting the code work correctly
  #regardless of the how many lines of code it would take.
  #It was fun and helpful to spend more time refactoring code and seeing what to look for, like repeating variables or unnecessary calls