require_relative 'player'
require_relative 'die'

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
  end
end
