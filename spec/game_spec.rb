require_relative '../lib/battleship'
require 'spec_helper'

describe Game do
  let(:game) { Game.new }

  it "sets up two empty game boards" do
    expect(game.player1.board.ready?).to eql(false)
    expect(game.player2.board.ready?).to eql(false)
  end

  it "begins when the boards are ready" do
    expect(game.phase).to eql("setup")
    setup_game
    expect(game.phase).to eql("play")
  end

  it "knows when it has been won" do
    expect(game.over?).to eql(false)
    setup_game
    game.player1.board.bomb("A1")
    game.player1.board.bomb("A2")
    game.player1.board.bomb("A3")
    game.player1.board.bomb("A4")
    game.player1.board.bomb("A5")
    game.player1.board.bomb("A6")
    game.player1.board.bomb("A7")
    game.player1.board.bomb("B1")
    game.player1.board.bomb("B2")
    game.player1.board.bomb("B3")
    game.player1.board.bomb("B4")
    game.player1.board.bomb("B5")
    game.player1.board.bomb("B6")
    game.player1.board.bomb("B7")
    game.player1.board.bomb("B8")
    game.player1.board.bomb("B9")
    game.player1.board.bomb("B10")
    expect(game.over?).to eql(true)
  end

  it "knows whose turn it is" do
    setup_game
    expect(game.turn).to eql("Danny")
  end

end
