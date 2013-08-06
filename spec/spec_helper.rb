def setup_game 
  game.player1.board.set(game.player1.board.tray[:frigate], "A1", "A2", "A3")
  game.player1.board.set(game.player1.board.tray[:battleship], "A4", "A5", "A6", "A7")
  game.player1.board.set(game.player1.board.tray[:carrier], "B1", "B2", "B3", "B4", "B5")
  game.player1.board.set(game.player1.board.tray[:cruiser], "B6", "B7", "B8")
  game.player1.board.set(game.player1.board.tray[:destroyer], "B9", "B10")
  game.player2.board.set(game.player2.board.tray[:frigate], "A1", "A2", "A3")
  game.player2.board.set(game.player2.board.tray[:battleship], "A4", "A5", "A6", "A7")
  game.player2.board.set(game.player2.board.tray[:carrier], "B1", "B2", "B3", "B4", "B5")
  game.player2.board.set(game.player2.board.tray[:cruiser], "B6", "B7", "B8")
  game.player2.board.set(game.player2.board.tray[:destroyer], "B9", "B10")
end
