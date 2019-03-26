require "spec_helper"
require "game"
require "player"
require "dealer"
require "black_jack"

describe Game do
  let(:game) { Game.new }

  describe "#play_game" do
    before do
      game.player.instance_variable_set(:@hand_cards, [Card.new("♠", "A"), Card.new("♠", "3")])
      game.dealer.instance_variable_set(:@hand_cards, [Card.new("♠", "4"), Card.new("♠", "5")])
    end

    context "勝利する場合" do
      it "勝利ですと表示" do
        game.deck.instance_variable_set(:@cards, [Card.new("♠", "6"), Card.new("♠", "8")])
        allow(STDIN).to receive(:gets).and_return "y", "n"
        expect(STDOUT).to receive(:puts).with("ゲームを開始します")
        expect(STDOUT).to receive(:puts).with("プレイヤーの手札は ♠A , ♠3 です")
        expect(STDOUT).to receive(:puts).with("プレイヤーの得点は 14 です")
        expect(STDOUT).to receive(:puts).with("ディーラーの手札の1枚目は ♠4 です")
        expect(STDOUT).to receive(:puts).with("プレイヤーの番です")
        expect(STDOUT).to receive(:puts).with("ドローしますか? y/n")
        expect(STDOUT).to receive(:puts).with("ドローします")
        expect(STDOUT).to receive(:puts).with("現在の手札は ♠A , ♠3 , ♠6 です")
        expect(STDOUT).to receive(:puts).with("プレイヤーの得点は 20 です")
        expect(STDOUT).to receive(:puts).with("ドローしますか? y/n")
        expect(STDOUT).to receive(:puts).with("ドローしませんでした")
        expect(STDOUT).to receive(:puts).with("勝負します")
        expect(STDOUT).to receive(:puts).with("ディーラーの手札は ♠4 , ♠5 , ♠8 でした")
        expect(STDOUT).to receive(:puts).with("ディーラーの得点は 17 です")
        expect(STDOUT).to receive(:puts).with("プレイヤーの合計は 20 です ディーラーの合計は 17 です")
        expect(STDOUT).to receive(:puts).with("勝利です")
        game.play_game
      end
    end

    context "敗北する場合" do
      it "敗北ですと表示" do
        game.deck.instance_variable_set(:@cards, [Card.new("♠", "8")])
        allow(STDIN).to receive(:gets).and_return "n"
        expect(STDOUT).to receive(:puts).with("ゲームを開始します")
        expect(STDOUT).to receive(:puts).with("プレイヤーの手札は ♠A , ♠3 です")
        expect(STDOUT).to receive(:puts).with("プレイヤーの得点は 14 です")
        expect(STDOUT).to receive(:puts).with("ディーラーの手札の1枚目は ♠4 です")
        expect(STDOUT).to receive(:puts).with("プレイヤーの番です")
        expect(STDOUT).to receive(:puts).with("ドローしますか? y/n")
        expect(STDOUT).to receive(:puts).with("ドローしませんでした")
        expect(STDOUT).to receive(:puts).with("勝負します")
        expect(STDOUT).to receive(:puts).with("ディーラーの手札は ♠4 , ♠5 , ♠8 でした")
        expect(STDOUT).to receive(:puts).with("ディーラーの得点は 17 です")
        expect(STDOUT).to receive(:puts).with("プレイヤーの合計は 14 です ディーラーの合計は 17 です")
        expect(STDOUT).to receive(:puts).with("敗北です")
        game.play_game
      end
    end

    context "引き分けする場合" do
      it "引き分けですと表示" do
        game.deck.instance_variable_set(:@cards, [Card.new("♠", "6"), Card.new("♠", "7"), Card.new("♣︎", "4")])
        allow(STDIN).to receive(:gets).and_return "y", "n"
        expect(STDOUT).to receive(:puts).with("ゲームを開始します")
        expect(STDOUT).to receive(:puts).with("プレイヤーの手札は ♠A , ♠3 です")
        expect(STDOUT).to receive(:puts).with("プレイヤーの得点は 14 です")
        expect(STDOUT).to receive(:puts).with("ディーラーの手札の1枚目は ♠4 です")
        expect(STDOUT).to receive(:puts).with("プレイヤーの番です")
        expect(STDOUT).to receive(:puts).with("ドローしますか? y/n")
        expect(STDOUT).to receive(:puts).with("ドローします")
        expect(STDOUT).to receive(:puts).with("現在の手札は ♠A , ♠3 , ♠6 です")
        expect(STDOUT).to receive(:puts).with("プレイヤーの得点は 20 です")
        expect(STDOUT).to receive(:puts).with("ドローしますか? y/n")
        expect(STDOUT).to receive(:puts).with("ドローしませんでした")
        expect(STDOUT).to receive(:puts).with("勝負します")
        expect(STDOUT).to receive(:puts).with("ディーラーの手札は ♠4 , ♠5 , ♠7 , ♣︎4 でした")
        expect(STDOUT).to receive(:puts).with("ディーラーの得点は 20 です")
        expect(STDOUT).to receive(:puts).with("プレイヤーの合計は 20 です ディーラーの合計は 20 です")
        expect(STDOUT).to receive(:puts).with("引き分けです")
        game.play_game
      end
    end

    context "playerがバーストする場合" do
      it "バーストしました、敗北ですと表示" do
        game.deck.instance_variable_set(:@cards, [Card.new("♠", "J"), Card.new("♠", "Q")])
        allow(STDIN).to receive(:gets).and_return "y", "y"
        expect(STDOUT).to receive(:puts).with("ゲームを開始します")
        expect(STDOUT).to receive(:puts).with("プレイヤーの手札は ♠A , ♠3 です")
        expect(STDOUT).to receive(:puts).with("プレイヤーの得点は 14 です")
        expect(STDOUT).to receive(:puts).with("ディーラーの手札の1枚目は ♠4 です")
        expect(STDOUT).to receive(:puts).with("プレイヤーの番です")
        expect(STDOUT).to receive(:puts).with("ドローしますか? y/n")
        expect(STDOUT).to receive(:puts).with("ドローします")
        expect(STDOUT).to receive(:puts).with("現在の手札は ♠A , ♠3 , ♠J です")
        expect(STDOUT).to receive(:puts).with("プレイヤーの得点は 14 です")
        expect(STDOUT).to receive(:puts).with("ドローしますか? y/n")
        expect(STDOUT).to receive(:puts).with("ドローします")
        expect(STDOUT).to receive(:puts).with("現在の手札は ♠A , ♠3 , ♠J , ♠Q です")
        expect(STDOUT).to receive(:puts).with("プレイヤーの得点は 24 です")
        expect(STDOUT).to receive(:puts).with("バーストしました、敗北です")
        game.play_game
      end
    end

    context "dealerがバーストする場合" do
      it "ディーラーがバーストしました、勝利ですと表示" do
        game.deck.instance_variable_set(:@cards, [Card.new("♠", "7"), Card.new("♠", "Q")])
        allow(STDIN).to receive(:gets).and_return "n"
        expect(STDOUT).to receive(:puts).with("ゲームを開始します")
        expect(STDOUT).to receive(:puts).with("プレイヤーの手札は ♠A , ♠3 です")
        expect(STDOUT).to receive(:puts).with("プレイヤーの得点は 14 です")
        expect(STDOUT).to receive(:puts).with("ディーラーの手札の1枚目は ♠4 です")
        expect(STDOUT).to receive(:puts).with("プレイヤーの番です")
        expect(STDOUT).to receive(:puts).with("ドローしますか? y/n")
        expect(STDOUT).to receive(:puts).with("ドローしませんでした")
        expect(STDOUT).to receive(:puts).with("勝負します")
        expect(STDOUT).to receive(:puts).with("ディーラーの手札は ♠4 , ♠5 , ♠7 , ♠Q でした")
        expect(STDOUT).to receive(:puts).with("ディーラーの得点は 26 です")
        expect(STDOUT).to receive(:puts).with("ディーラーがバーストしました、勝利です")
        game.play_game
      end
    end

    context "playerの手札が21にだった場合" do
      before do
        game.player.instance_variable_set(:@hand_cards, [Card.new("♠", "A"), Card.new("♠", "J")])
        game.dealer.instance_variable_set(:@hand_cards, [Card.new("♠", "4"), Card.new("♠", "5")])
      end
      it "勝利ですと表示する" do
        game.deck.instance_variable_set(:@cards, [Card.new("♠", "8"), Card.new("♠", "Q")])
        allow(STDIN).to receive(:gets).and_return "y"
        expect(STDOUT).to receive(:puts).with("ゲームを開始します")
        expect(STDOUT).to receive(:puts).with("プレイヤーの手札は ♠A , ♠J です")
        expect(STDOUT).to receive(:puts).with("プレイヤーの得点は 21 です")
        expect(STDOUT).to receive(:puts).with("プレイヤーはブラックジャックです")
        expect(STDOUT).to receive(:puts).with("ディーラーの手札は ♠4 , ♠5 でした")
        expect(STDOUT).to receive(:puts).with("ディーラーの得点は 9 です")
        expect(STDOUT).to receive(:puts).with("勝利です")
        game.play_game
      end
    end

    context "dealerの手札が21だった場合" do
      before do
        game.player.instance_variable_set(:@hand_cards, [Card.new("♠", "2"), Card.new("♠", "3")])
        game.dealer.instance_variable_set(:@hand_cards, [Card.new("♠", "A"), Card.new("♠", "J")])
      end
      it "敗北ですと表示する" do
        game.deck.instance_variable_set(:@cards, [Card.new("♠", "7"), Card.new("♣︎", "5")])
        allow(STDIN).to receive(:gets).and_return "n"
        expect(STDOUT).to receive(:puts).with("ゲームを開始します")
        expect(STDOUT).to receive(:puts).with("プレイヤーの手札は ♠2 , ♠3 です")
        expect(STDOUT).to receive(:puts).with("プレイヤーの得点は 5 です")
        expect(STDOUT).to receive(:puts).with("ディーラーの手札の1枚目は ♠A です")
        expect(STDOUT).to receive(:puts).with("プレイヤーの番です")
        expect(STDOUT).to receive(:puts).with("ドローしますか? y/n")
        expect(STDOUT).to receive(:puts).with("ドローしませんでした")
        expect(STDOUT).to receive(:puts).with("勝負します")
        expect(STDOUT).to receive(:puts).with("ディーラーの手札は ♠A , ♠J でした")
        expect(STDOUT).to receive(:puts).with("ディーラーの得点は 21 です")
        expect(STDOUT).to receive(:puts).with("ディーラーはブラックジャックです")
        expect(STDOUT).to receive(:puts).with("敗北です")
        game.play_game
      end
    end

    context "どちらもブラックジャックだった時" do
      before do
        game.player.instance_variable_set(:@hand_cards, [Card.new("♠", "A"), Card.new("♠", "J")])
        game.dealer.instance_variable_set(:@hand_cards, [Card.new("♣︎", "A"), Card.new("♣︎", "J")])
      end
      it "敗北ですと表示する" do
        allow(STDIN).to receive(:gets).and_return "n"
        expect(STDOUT).to receive(:puts).with("ゲームを開始します")
        expect(STDOUT).to receive(:puts).with("プレイヤーの手札は ♠A , ♠J です")
        expect(STDOUT).to receive(:puts).with("プレイヤーの得点は 21 です")
        expect(STDOUT).to receive(:puts).with("ディーラーの手札は ♣︎A , ♣︎J でした")
        expect(STDOUT).to receive(:puts).with("ディーラーの得点は 21 です")
        expect(STDOUT).to receive(:puts).with("どちらもブラックジャックです")
        expect(STDOUT).to receive(:puts).with("敗北です")
        game.play_game
      end
    end
  end
end

