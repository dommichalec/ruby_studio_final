# run ruby bin/studio_game.rb
module StudioGame
  require_relative '../lib/studio_game/game'
  require_relative '../lib/studio_game/clumsy_player'
  require_relative '../lib/studio_game/berzerk_player'


  player1 = Player.new("moe")
  player2 = Player.new("larry", 60)
  player3 = Player.new("curly", 125)
  player4 = ClumsyPlayer.new("klutz", 105, 3)
  berserker = BerzerkPlayer.new("berserker", 50)
  game = StudioGame::Game.new("thunderdome")
  game.add(player1)
  game.add(player2)
  game.add(player3)
  game.add(player4)
  game.add(berserker)
  game.play(5)
  game.print_stats
end
