require "spec_helper"
require "game"
require "player"
require "dealer"
require "black_jack"

describe Game do
  let(:game) { Game.new }
  describe "#play_game" do
    it "ゲームをプレイする" do
      game.play_game
    end
  end
end

