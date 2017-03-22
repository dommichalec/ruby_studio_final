require_relative 'treasure_trove'
require_relative 'player'

module StudioGame
  class ClumsyPlayer < Player
    attr_accessor :boost_factor

    def initialize(name, health=100, boost_factor=1)
      super(name, health)
      @boost_factor = boost_factor
    end

    def w00t!
      # w00t! a ClumsyPlayer by the boost_factor
      @boost_factor.times { super }
    end

    # add the found treasure to the user's treasures chest hash and half the points
    def find(treasure)
      damaged_treasure = Treasure.new(treasure.name, treasure.points / 2.0)
      # pass the damanged treasure back up to the parent class Player definition
      # of player.find method
      super(damaged_treasure)
    end
  end

  # put file-specific example code here
  if __FILE__ == $0
    clumsy = ClumsyPlayer.new("klutz")

    hammer = Treasure.new(:hammer, 50)
    clumsy.find(hammer)
    clumsy.find(hammer)
    clumsy.find(hammer)

    crowbar = Treasure.new(:crowbar, 400)
    clumsy.find(crowbar)

    clumsy.each_found_treasure do |treasure|
      puts "#{treasure.points} total #{treasure.name} points"
    end
    puts "#{clumsy.points} grand total points"
  end
end
