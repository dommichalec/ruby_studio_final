require_relative 'game_turn'

class Game
  attr_reader :title
  # create initial state of game with a name and container for players
  def initialize(title)
    @title = title.capitalize
    @players = Array.new
  end

  # add players to the @players array
  def add(player)
    @players << player
  end

  def play
    puts "There are #{@players.size} players in #{@name}"
    @players.each do |p|
      GameTurn.take_turn(p)
    end
  end
end

# put file-specific example code here
if __FILE__ == $0
end
