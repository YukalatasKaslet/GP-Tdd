class LayingHen
  attr_reader :age, :eggs

  def initialize
    @age = 0
    @eggs = 0
    @hatched_hours = 0
  end

  # Ages the hen one month, and lays 4 eggs if the hen is older than 3 months
  def age!
    @age += 1
    if @age > 3 && @age < 10
      4.times { @eggs += 1 }
    end  
  end

  # Returns "true" if the hen has laid any eggs, "false" otherwise
  def any_eggs?
    @eggs > 0? true : false
  end

  # Returns an Egg if there are any
  # Raises a NoEggsError otherwise
  def pick_an_egg!
    raise NoEggsError, "The hen has not layed any eggs" unless self.any_eggs?
    @eggs -= 1
    Egg.new(@hatched_hours)
  end

  # Returns "true" if the hen can't laid eggs anymore because of its age, "false" otherwise.
  # The max age for a hen to lay eggs is 10 
  def old?
    @age < 10 ? false : true 
  end

  def increase_hatched_hour(hours)
    @hatched_hours = hours 
  end

end#class LayingHen

class Egg
        #attr_reader :hatched_hours
  # Initializes a new Egg with hatched hours +hatched_hours+
  def initialize(hatched_hours)
    @hatched_hours = hatched_hours
  end

  # Return +true+ if hatched hours is greater than 3, +false+ otherwise
  def rotten?
    @hatched_hours > 3 ? true : false
  end
end#Class Egg

class NoEggsError < StandardError; end





# hen = LayingHen.new
# basket = []
# rotten_eggs = 0
#       # puts "*"*5
# hen.age! until hen.any_eggs? #Incrementa la edad hasta que ponga huevos
#       # puts "*"*5
# puts "Hen is #{hen.age} months old, its starting to laid eggs."
# puts ""
#       # puts "*"*5
# until hen.old?
#   #The time we take to pick up the eggs
#   hours = rand(5)
#       # puts hours
#   hen.increase_hatched_hour(hours)


#   while hen.any_eggs?
#     egg = hen.pick_an_egg!      

#       # puts egg.rotten?
#       # puts egg.hatched_hours
#     if egg.rotten?
#       rotten_eggs += 1
#     else
#       basket << egg
#     end
#   end

#   puts "Month #{hen.age} Report"
#   puts "We took #{hours} hour(s) to pick the eggs"
#   puts "Eggs in the basket: #{basket.size}"
#   puts "Rotten eggs: #{rotten_eggs}"
#   puts ""

#   # Age the hen another month
#   hen.age!
# end
#       # puts "*"*10
# puts "The hen is old, she can't laid more eggs!"
# puts "The hen laid #{basket.size + rotten_eggs} eggs"
# if rotten_eggs == 0
#   puts "CONGRATULATIONS NO ROTTEN EGGS" 
# else
#   puts "We pick to late #{rotten_eggs} eggs so they become rotten"
# end
