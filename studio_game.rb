require_relative 'game'

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)
game = Game.new("thunderdome")
game.add(player1)
game.add(player2)
game.add(player3)
game.play
