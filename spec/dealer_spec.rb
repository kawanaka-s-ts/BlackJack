require "dealer"
require "deck"
require "spec_helper"

describe Dealer do
  let(:dealer) { Dealer.new(Card.new("♠", "A"), Card.new("♠", "2")) }
  let(:deck) { Deck.new }

  describe "#show-first_card" do
    it "手札の一枚目を表示する" do
      expect(dealer.show_first_card).to eq "♠A"
    end
  end
end
