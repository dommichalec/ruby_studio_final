require_relative 'player'
require_relative 'die'
require_relative 'treasure_trove'

module StudioGame
  module GameTurn

    # create a module method that encapsulates the turn taking behavior
    def self.take_turn(player)
      die = Die.new
      case die.roll
      when 5..6
        player.w00t!
        puts "#{player.name} was w00ted!."
      when 3..4
        puts "#{player.name} was skipped."
      when 1..2
        player.blam!
        puts "#{player.name} was blammed!"
      end

      # a player finds a treasure at the end of each round
      treasure = TreasureTrove.random
      player.find(treasure)
    end
  end
end
