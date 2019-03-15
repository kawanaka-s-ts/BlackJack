require "user_base"
require "deck"
require "spec_helper"

describe UserBase do
  let(:user_base) { UserBase.new }
  let(:deck) { Deck.new }
  
  describe "#draw" do
    it "引いたカードを手札に加える" do
      deck.instance_variable_set(:@cards, ["♠1", "♠2", "♠3"])
      expect(user_base.draw(deck)).to eq ["♠1"]
    end
  end

  describe "#show_hand_cards" do
    it "手札を表示する" do
      user_base.instance_variable_set(:@hand_cards, [Card.new("♠", "A"), Card.new("♠", "2"), Card.new("♠", "Q")])
      expect(user_base.show_hand_cards).to eq ["♠A", "♠2", "♠Q"]
    end
  end
end
