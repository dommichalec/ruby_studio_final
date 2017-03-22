# class Treasure
  # attr_reader :name
  # attr_writer :carbs

  # def initialize(name, points)
    # @name = name
    # @point_value = points
  # end
# end

module StudioGame
  Treasure = Struct.new(:name, :points)

  module TreasureTrove

    TREASURES = [
      Treasure.new(:pie, 5),
      Treasure.new(:bottle, 25),
      Treasure.new(:hammer, 50),
      Treasure.new(:skillet, 100),
      Treasure.new(:broomstick, 200),
      Treasure.new(:crowbar, 400)
    ]

    # return a random Treasure
    def self.random
      TREASURES.sample
    end
  end

  # put file-specific example code here
  if __FILE__ == $0
  end
end
