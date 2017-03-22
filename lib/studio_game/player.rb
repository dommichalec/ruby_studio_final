require_relative 'playable'
module StudioGame
  class Player
    include Playable
    # getter and setter method for the name and health attributes
    attr_accessor :health
    attr_accessor :name
    # create initial state of player objects with default health of 100
    def initialize(name, health=100)
      @name = name.capitalize
      @health = health
      # create a hash with default value pairs of zero
      @treasure_chest = Hash.new(0)
    end

    # print out the following string everytime puts is called on object
    def to_s
      "My name is #{name} with a health of #{health}."
    end

    def each_treasure
      @treasure_chest.each do |name, points|
        yield Treasure.new(name, points)
      end
    end

    # add the found treasure to the user's treasures chest hash
    def find(treasure)
      @treasure_chest[treasure.name] += treasure.points
      puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
      puts "#{@name}'s treasures: #{@treasure_chest}"
    end

    # add up all the points in a player's treasure chest as a virtual attribute
    def points
      @treasure_chest.values.reduce(0, :+)
    end

    # sort players by descending scores
    def <=>(other)
      other.score <=> score
    end

    # create a virtual attribute comprised of player's name and health
    def score
      @health + self.points
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
end
