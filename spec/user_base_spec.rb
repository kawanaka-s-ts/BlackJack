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
end
