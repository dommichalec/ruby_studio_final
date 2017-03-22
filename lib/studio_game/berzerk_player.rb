require_relative 'player'
module StudioGame
  class BerzerkPlayer < Player

    def initialize(name, health=100, woot_count=0)
      # pass the name and health parameters to the initialize method in the Player
      # class
      super(name, health)
      @woot_count = 0
    end

    # returns true if value of woot_count is greater than 5
    def berzerk?
      @woot_count >= 5
    end

    #
    def w00t!
      # run the w00t! method in the parent Player class
      super
      # increase w00t_count by 1
      @woot_count += 1
      # print a message if a player has gone berzerk
      puts "#{@name} is berserk!" if berzerk?
    end

    # if player has gone berzerk, w00t! instead of blam!, else blam! the player
    # from the blam! method defined in the parent Player class
    def blam!
      berzerk? ? w00t! : super
    end
  end

  # put file-specific example code here
  if __FILE__ == $0
    berserker = BerserkPlayer.new("berserker", 50)
    6.times { berserker.w00t }
    2.times { berserker.blam }
    puts berserker.health
  end
end
