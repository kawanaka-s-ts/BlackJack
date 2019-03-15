require "card"
require "spec_helper"

describe Card do
  let(:card) { Card.new("♠", 1) }

  describe "#show_suit" do
    it "カードの柄を表示する" do
      expect(card.show_suit).to eq "♠"
    end
  end

  describe "#show_number" do
    it "カードの数字を表示する" do
      expect(card.show_number).to eq 1
    end
  end

  describe "#convert_num" do
    context "数字が1の場合" do
      it "A返す" do
        expect(card.convert_num).to eq "A"
      end
    end

    context "数字が11の場合" do
      let(:card) { Card.new("♠", 11) } 
      it "Jを返す" do
        expect(card.convert_num).to eq "J"
      end
    end

    context "数字が12の場合" do
      let(:card) { Card.new("♠", 12) } 
      it "Qを返す" do
        expect(card.convert_num).to eq "Q"
      end
    end

    context "数字が13の場合" do
      let(:card) { Card.new("♠", 13) } 
      it "Kを返す" do
        expect(card.convert_num).to eq "K"
      end
    end
  end
end
