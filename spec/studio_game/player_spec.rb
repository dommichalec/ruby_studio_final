require 'studio_game/player'
require 'studio_game/spec_helper'
module StudioGame
  # define a Player example group with describe
  # run rspec player_spec.rb --color to run test suite
  describe Player do

    # extract player state to before block
    before do
      @player = Player.new("dom", 10)
    end

    # expect a capitalized name
    it "should have a capitalized name" do
      # expect(@player.name).to eq("Dom")
      @player.name.should == "Dom"
    end

    # expect to_s to return name and health
    it "should return name and health with to_s" do
      # expect(@player.to_s).to eq("My name is Dom with a health of 10")
      @player.to_s.should == "My name is Dom with a health of 10."
    end

    # expect a w00t! to increase health by 10
    it "should increase health by 10 if w00ted" do
      @player.w00t!
      # expect(@player.health).to eq(20)
      @player.health.should == 25
    end

    # expect a blam! to decrease health by 15
    it "should decrease health by 10 if blammed" do
      @player.blam!
      # expect(@player.health).to eq(0)
      @player.health.should == 0
    end

    # expect a players score (virtual attribute) to equal health plus name length
    it "should have a score equal to its health plus length of name" do
      @player.score
      # expect(@player.score).to eq(10)
      @player.score.should == 10
    end

    # set up a player with a default initial health for context
    context do

      # extract player state to before block
      before do
        @initial_health = 100
        @player = Player.new("dom", @initial_health)
      end

      it "should have an initial health of 100" do
        # expect(@player.health).to eq(100)
        @player.health.should == 100
      end
    end

    # set up a player with a default initial health and status for context
    context do

      # extract player state to before block
      before do
        @player = Player.new("dom")
      end

      # should be strong if health is greater than or equal to 100
      it "should be strong" do
        # @player.strong?.should == true
        @player.should be_strong
      end
    end

    # set up a player with a health of 150
    context do

      before do
        @player = Player.new("dom", 150)
      end

      # expect the player to be strong
      it "should be considered strong" do
        # @player.strong?.should == true
        # expect(@player.strong?).to eq(true)
        @player.should be_strong
      end
    end

    # set up a player with a health of 150
    context do

      before do
        @player = Player.new("dom", 9)
      end

      # expect the player to be strong
      it "should be considered strong" do
        # @player.strong?.should == false
        # expect(@player.strong?).to eq(false)
        @player.should_not be_strong
      end
    end

    it "computes points as the sum of all treasure points" do
      @player.points.should == 0

      @player.find(Treasure.new(:hammer, 50))
      @player.points.should == 50

      @player.find(Treasure.new(:crowbar, 400))
      @player.points.should == 450

      @player.find(Treasure.new(:hammer, 50))
      @player.points.should == 500
    end

    context "in a collection of players" do
      before do
        @player1 = Player.new("moe", 100)
        @player2 = Player.new("larry", 200)
        @player3 = Player.new("curly", 300)

        @players = [@player1, @player2, @player3]
      end

      it "is sorted by decreasing score" do
        @players.sort.should == [@player3, @player2, @player1]
      end
    end
  end
end
