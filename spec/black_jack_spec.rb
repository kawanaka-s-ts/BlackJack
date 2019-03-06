require "black_jack"
require "spec_helper"

describe BlackJack do
  let(:black_jack){BlackJack.new}
  let(:dealer_cards){[10, 10]}
  describe "#decision" do
    context "playerの手札の合計が相手より21に近い場合" do
      it "'勝利'と表示する" do
        player_cards = [10, 11]
        expect(black_jack.decision(player_cards, dealer_cards)).to eq '勝利'
      end
    end

    context "playerと相手の手札の合計が同じ場合" do
      it "'引き分け'と表示する" do
        player_cards = [10, 10]
        expect(black_jack.decision(player_cards, dealer_cards)).to eq '引き分け'
      end
    end

    context "playerの手札の合計が21を超えた場合" do
      it "'敗北'と表示する" do
        player_cards = [10, 10, 2]
        expect(black_jack.decision(player_cards, dealer_cards)).to eq '敗北'
      end
    end
  end
end
