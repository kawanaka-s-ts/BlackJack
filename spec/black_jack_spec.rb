require "black_jack"
require "deck"
require "card"
require "player"
require "dealer"
require "spec_helper"

describe BlackJack do
  let(:black_jack) { BlackJack.new }
  let(:player) { Player.new(Card.new("♠", "A"), Card.new("♠", "2")) }
  let(:dealer) { Dealer.new }

  describe "#convert_score" do
    subject { black_jack.total_score(cards) }
    context "カードの数字が10以上の場合" do
      let(:cards) {  [Card.new("♠", "J")] }
      it "10として扱う" do
        is_expected.to eq 10
      end
    end

    context "手札が複数ある場合" do
      let(:cards) { [Card.new("♠", "2"), Card.new("♠", "3"), Card.new("♠", "Q")] }
      it "変換した値の合計得点を返す" do
        is_expected.to eq 15
      end
    end
  end

  describe "#ace_count" do
    context "Aが2つある場合" do
      let(:cards) { [Card.new("♠", "A"), Card.new("♠", "3"), Card.new("♦︎", "A")] }
      it "2を返す" do
        expect(black_jack.ace_count(cards)).to eq 2 
      end
    end
  end

  describe "#burst?" do
    context "21を超える場合" do
      let(:cards) { [Card.new("♠", "10"), Card.new("♠", "5"), Card.new("♠", "7")] }
      it "trueを返す" do
        expect(black_jack.burst?(cards)).to eq true
      end
    end

    context "21を超えない場合" do
      let(:cards) { [Card.new("♠", "10"), Card.new("♠", "5"), Card.new("♠", "6")] }
      it "falseを返す" do
        expect(black_jack.burst?(cards)).to eq false
      end
    end

    context "21を超えるが手札にAがある時" do
      let(:cards) { [Card.new("♠", "A"), Card.new("♠", "5"), Card.new("♠", "6")] }
      it "trueを返す" do
        expect(black_jack.burst?(cards)).to eq false
      end
    end
  end

  describe "#decision" do
    subject { black_jack.decision(player, dealer) }
    context "playerの手札の合計がdealeの手札の合計より21に近い場合" do
      it "勝利と表示する" do
        player.instance_variable_set(:@hand_cards, [Card.new("♠", "3")])
        dealer.instance_variable_set(:@hand_cards, [Card.new("♠", "2")])
        is_expected.to eq '勝利'
      end
    end

    context "playerの手札の合計がdealeの手札の合計より21に近い場合" do
      it "勝利と表示する" do
        player.instance_variable_set(:@hand_cards, [Card.new("♠", "2")])
        dealer.instance_variable_set(:@hand_cards, [Card.new("♠", "3")])
        is_expected.to eq '敗北'
      end
    end

    context "playerと相手の手札の合計が同じ場合" do
      it "引き分けと表示する" do
        player.instance_variable_set(:@hand_cards, [Card.new("♠", "A")])
        dealer.instance_variable_set(:@hand_cards, [Card.new("♠", "A")])
        is_expected.to eq '引き分け'
      end
    end
  end

  describe "#dealer_action" do

    before do
      dealer.instance_variable_set(:@hand_cards, [Card.new("♠", "A"), Card.new("♠", "2")])
      dealer.deck.instance_variable_set(:@cards, [Card.new("♠", "4"), Card.new("♠", "5"), Card.new("♠", "3")])
    end

    context "1枚目を引くと17になる時" do
      it "１回のみドローする" do
        expect(dealer).to receive(:deal).with(dealer.hand_cards).and_call_original.once
        black_jack.dealer_action(dealer)
      end
    end
  end

  describe "#player_action" do
    context "yが入力された時" do
      it "カードを引く" do
        dealer.deck.instance_variable_set(:@cards, [Card.new("♠", "A")])
        player.instance_variable_set(:@hand_cards, [])
        allow(STDIN).to receive(:gets).and_return "y"
        expect(STDOUT).to receive(:puts).with("ドローしますか? y/n")
        expect(STDOUT).to receive(:puts).with("ドローします")
        expect(STDOUT).to receive(:puts).with("現在の手札は ♠A です")
        black_jack.player_action(dealer, player)
      end
    end

    context "nが入力された時" do
      it "カードを引く" do
        allow(STDIN).to receive(:gets).and_return "n"
        expect(STDOUT).to receive(:puts).with("ドローしますか? y/n")
        expect(STDOUT).to receive(:puts).with("ドローしませんでした")
        black_jack.player_action(dealer, player)
      end
    end

    context "yが入力された時" do
      it "カードを引く" do
        allow(STDIN).to receive(:gets).and_return "a"
        expect(STDOUT).to receive(:puts).with("ドローしますか? y/n")
        expect(STDOUT).to receive(:puts).with("無効な文字列が入力されました、再度入力してください y/n")
        black_jack.player_action(dealer, player)
      end
    end
  end
end
