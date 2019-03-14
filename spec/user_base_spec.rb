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

  describe "#convert_score" do
    context "カードの数字が10以上の場合" do
      it "10として扱う" do
        user_base.instance_variable_set(:@hand_cards, [Card.new("♠", 11)])
        expect(user_base.convert_total_score).to eq 10
      end
    end

    context "手札が複数ある場合" do
      it "変換した値の合計得点を返す" do
        user_base.instance_variable_set(:@hand_cards, [Card.new("♠", 1), Card.new("♠", 2), Card.new("♠", 12)])
        expect(user_base.convert_total_score).to eq 13
      end
    end
  end
end
