require "dealer"
require "deck"
require "spec_helper"

describe Dealer do
  let(:dealer) { Dealer.new(Card.new("♠", "A"), Card.new("♠", "2")) }
  let(:deck) { Deck.new }

  describe "#dealer_action" do
    it "17以上になるまでドローする" do
      deck.instance_variable_set(:@cards, [Card.new("♠", "J"), Card.new("♠", "4"), Card.new("♠", "5")])
      expect(dealer.dealer_action(deck)).to eq 17
    end
  end

  describe "#show-first_card" do
    it "手札の一枚目を表示する" do
      expect(dealer.show_first_card).to eq "♠A"
    end
  end
end
