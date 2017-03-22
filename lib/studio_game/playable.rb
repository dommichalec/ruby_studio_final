module StudioGame
  module Playable
    # increase health by a 10 if w00ted
    def w00t!
      self.health += 15
    end

    # decrease health by 15 if blammed
    def blam!
      self.health -= 10
    end

    # determine if player is strong
    def strong?
      self.health >= 100
    end
  end
end
