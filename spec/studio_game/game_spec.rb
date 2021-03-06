require 'studio_game/game'
require 'studio_game/spec_helper'

module StudioGame
  describe Game do

    before do
      @game = Game.new("Knuckleheads")

      @initial_health = 100
      @player = Player.new("moe", @initial_health)

      @game.add(@player)
    end

    it "w00ts the player if a high number is rolled" do
      #allow_any_instance_of(Die).to receive(:roll).and_return(5)
      Die.any_instance.stub(:roll).and_return(5)

      @game.play(1)

      @player.health.should == @initial_health + 15
    end

    it "skips the player if a medium number is rolled" do
      #allow_any_instance_of(Die).to receive(:roll).and_return(3)
      Die.any_instance.stub(:roll).and_return(3)

      @game.play(1)

      @player.health.should == @initial_health
    end

    it "blams a player if a low number is rolled" do
      #allow_any_instance_of(Die).to receive(:roll).and_return(3)
      Die.any_instance.stub(:roll).and_return(1)

      @game.play(1)

      @player.health.should == @initial_health - 10
    end
  end
end
