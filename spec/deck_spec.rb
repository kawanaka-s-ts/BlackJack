require "deck"
require "card"
require "spec_helper"

describe Deck do
  let(:deck){Deck.new}
  describe "#build" do
    it "52回Cardが作られる" do
      expect(Card).to receive(:new).exactly(52).times
      deck.build
    end
  end
end
