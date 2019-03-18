require "dealer"
require "deck"
require "spec_helper"

describe Dealer do
  let(:dealer) { Dealer.new(Card.new("♠", "A"), Card.new("♠", "2")) }
  let(:deck) { Deck.new }

  describe "#dealer_action" do
    context "2枚目を引いた時、17になる時"
    it "手札が17より低い間引き続ける" do
      deck.instance_variable_set(:@cards, [Card.new("♠", "J"), Card.new("♠", "4"), Card.new("♠", "5")])
      expect(dealer.dealer_action(deck)).to eq 17
    end
  end
end
