require "black_jack"
require "deck"
require "card"
require "player"
require "dealer"
require "spec_helper"

describe BlackJack do
  let(:black_jack) { BlackJack.new }
  let(:player) { Player.new }
  let(:dealer) { Dealer.new }
  let(:dealer_cards) { [10, 10] }

  describe "#convert_score" do
    context "カードの数字が10以上の場合" do
      it "10として扱う" do
        player.instance_variable_set(:@hand_cards, [Card.new("♠", "J")])
        expect(black_jack.convert_total_score(player)).to eq 10
      end
    end

    context "手札が複数ある場合" do
      it "変換した値の合計得点を返す" do
        player.instance_variable_set(:@hand_cards, [Card.new("♠", "A"), Card.new("♠", "2"), Card.new("♠", "Q")])
        expect(black_jack.convert_total_score(player)).to eq 13
      end
    end
  end

  describe "#decision" do
    context "playerの手札の合計が相手より21に近い場合" do
      it "勝利と表示する" do
        player.instance_variable_set(:@hand_cards, [Card.new("♠", "2")])
        dealer.instance_variable_set(:@hand_cards, [Card.new("♠", "A")])
        expect(black_jack.decision(player, dealer)).to eq '勝利'
      end
    end

    context "playerと相手の手札の合計が同じ場合" do
      it "引き分けと表示する" do
        player.instance_variable_set(:@hand_cards, [Card.new("♠", "A")])
        dealer.instance_variable_set(:@hand_cards, [Card.new("♠", "A")])
        expect(black_jack.decision(player, dealer)).to eq '引き分け'
      end
    end

    context "playerの手札の合計が21を超えた場合" do
      it "敗北と表示する" do
        player.instance_variable_set(:@hand_cards, [Card.new("♠", "J"), Card.new("♠", "Q"), Card.new("♠", "2")])
        dealer.instance_variable_set(:@hand_cards, [Card.new("♠", "A")])
        expect(black_jack.decision(player, dealer)).to eq '敗北'
      end
    end

    context "dealerの手札の合計が21を超えた場合" do
      it "勝利と表示する" do
        player.instance_variable_set(:@hand_cards, [Card.new("♠", "A")])
        dealer.instance_variable_set(:@hand_cards, [Card.new("♠", "J"), Card.new("♠", "Q"), Card.new("♠", "2")])
        expect(black_jack.decision(player, dealer)).to eq '勝利'
      end
    end
  end
end
