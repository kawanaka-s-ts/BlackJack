require "card"
require "spec_helper"

describe Card do
  let(:card){Card.new("♠", "1")}
  describe "#show_card" do
    it "カードの柄と数字を表示する" do
      expect(card.show_card).to eq "♠1"
    end
  end

  describe "#show_card_number" do
    it "カードの数字を表示する" do
      expect(card.show_card_number).to eq 1
    end
  end
end
