class Player
  # getter method for the health attribute
  attr_reader :health
  # getter and setter method for the name attribute
  attr_accessor :name

  # create initial state of player objects with default health of 100
  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
  end

  # print out the following string everytime puts is called on object
  def to_s
    "My name is #{name} with a health of #{health}."
  end

  # increase health by a 10 if w00ted
  def w00t!
    @health += 15
  end

  # decrease health by 15 if blammed
  def blam!
    @health -= 10
  end

  # determine if player is strong
  def strong?
    @health >= 100
  end

  # create a virtual attribute comprised of player's name and health
  def score
    @health + @name.length
  end
end

# put file-specific example code here
if __FILE__ == $0
  # access and change name attribute outside of the class (by default an object's state is
  # private)
  dom = Player.new("dom")
  puts dom.name
  dom.name = "Dominic"
  puts dom.name
  # access the health attribute outside of the class
  puts dom
end
