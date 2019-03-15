require "deck"
require "card"
require "spec_helper"

describe Deck do
  describe "#build" do
    let(:deck) { Deck.new }

    before do
      expect(Card).to receive(:new).exactly(52).times
    end

    it "52回Cardが作られる" do
      Deck.new
    end
  end

  describe "#drawCard" do
    let(:deck) { Deck.new }
    it "先頭の要素を取り出す" do
      deck.instance_variable_set(:@cards, ["♠1", "♠2", "♠3"])
      expect(deck.draw_card).to eq "♠1"
    end
  end
end
