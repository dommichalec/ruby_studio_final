require_relative 'game_turn'
require_relative 'treasure_trove'
module StudioGame
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

    # driver method for how the game is played
    def play(rounds)
      puts "\nThere are #{@players.size} players and " +
      "#{TreasureTrove::TREASURES.size} treasures in #{@title}"
      1.upto(rounds) do |round|
        puts "\nRound #{round}"
        @players.each do |p|
          GameTurn.take_turn(p)
        end
      end
    end

    # stylize how final score is presented
    def print_name_and_health(player)
      puts "#{player.name.ljust(20,'.')}#{player.score}"
      player.each_treasure do |treasure|
        puts "#{treasure.points} points from #{treasure.name}"
      end
      puts "...for a grand total of #{player.points} points."
    end

    def print_stats
      puts "\n#{@title}'s Final Scores:"
      sorted_players = @players.sort
      strong_players, wimpy_players = sorted_players.partition { |x| x.strong? }
      puts "Strong players:"
      strong_players.each do |strong_player|
        print_name_and_health(strong_player)
      end
      puts "Wimpy players:"
      wimpy_players.each do |wimpy_player|
        print_name_and_health(wimpy_player)
      end
    end
  end

  # put file-specific example code here
  if __FILE__ == $0
  end
end
