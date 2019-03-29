require "player"
require "deck"
require "spec_helper"

describe Player do
  let(:player) { Player.new(Card.new("♠", "A"), Card.new("♠", "2")) }

  describe "#show_hand_cards" do
    it "手札を表示する" do
      player.instance_variable_set(:@hand_cards, [Card.new("♠", "A"), Card.new("♠", "2"), Card.new("♠", "Q")])
      expect(player.show_hand_cards).to eq "♠A , ♠2 , ♠Q"
    end
  end
end
