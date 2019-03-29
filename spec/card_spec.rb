require "card"
require "spec_helper"

describe Card do
  let(:card) { Card.new("♠", "A") }

  describe "#suit" do
    it "カードの柄を表示する" do
      expect(card.suit).to eq "♠"
    end
  end

  describe "#rank" do
    it "カードのランクを表示する" do
      expect(card.rank).to eq "A"
    end
  end

  describe "#display" do
    it "カードのsuitとrankを表示する" do
      expect(card.display).to eq "♠A"
    end
  end
end
