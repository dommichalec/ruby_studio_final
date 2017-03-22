module StudioGame
  class Die

    # create initial state of die and call its roll method upon creation
    def initialize
      roll
    end

    # returns a random number between 1 and 6
    def roll
      @number = rand(1..6)
    end
  end


  # put file-specific example code here
  if __FILE__ == $0
    number_rolled = Die.new
    puts number_rolled
  end
end
