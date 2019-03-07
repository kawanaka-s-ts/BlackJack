require "user_base"
require "spec_helper"

describe UserBase do
  let(:user_base){UserBase.new}

  describe "#draw" do
    it "deckの先頭の数をhand_cardsに入れた後、deckからその値を削除" do
    deck = [1, 2, 3, 4, 5, 6]
      expect(user_base.draw(deck)).to eq 1
    end
  end

  describe "#show_cards" do
    context "渡された配列が[1, 1]の時" do
      it "1を♠、1をAに変換したものを返す" do
        hand_cards = [1, 1]
        expect(user_base.show_card(hand_cards)).to eq "♠A"
      end
    end

    context "渡された配列が[1, 2]の時" do
      it "1を♠に変換したものを返す(2はそのまま)" do
        hand_cards = [1, 2]
        expect(user_base.show_card(hand_cards)).to eq "♠2"
      end
    end

    context "渡された配列が[2, 11]の時" do
      it "2を♥、11をJに変換したものを返す" do
        hand_cards = [2, 11]
        expect(user_base.show_card(hand_cards)).to eq "♥J"
      end
    end

    context "渡された配列が[3, 12]の時" do
      it "3を♦、12をQに変換したものを返す" do
        hand_cards = [3, 12]
        expect(user_base.show_card(hand_cards)).to eq "♦Q"
      end
    end

    context "渡された配列が[4, 13]の時" do
      it "4を♣、13をKに変換したものを返す" do
        hand_cards = [4, 13]
        expect(user_base.show_card(hand_cards)).to eq "♣K"
      end
    end
  end
end
