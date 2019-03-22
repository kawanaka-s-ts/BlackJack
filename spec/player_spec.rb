require "player"
require "deck"
require "spec_helper"

describe Player do
  let(:player) { Player.new(Card.new("♠", "A"), Card.new("♠", "2")) }
  let(:deck) { Deck.new }

  describe "#player_action" do
    context "yが入力された時" do
      it "カードを引く" do
        deck.instance_variable_set(:@cards, [Card.new("♠", "A")])
        player.instance_variable_set(:@hand_cards, [])
        allow(STDIN).to receive(:gets).and_return "y"
        expect(STDOUT).to receive(:puts).with("ドローしますか? y/n")
        expect(STDOUT).to receive(:puts).with("ドローします")
        expect(STDOUT).to receive(:puts).with("現在の手札は ♠A です")
        player.player_action(deck)
      end
    end

    context "nが入力された時" do
      it "カードを引く" do
        allow(STDIN).to receive(:gets).and_return "n"
        expect(STDOUT).to receive(:puts).with("ドローしますか? y/n")
        expect(STDOUT).to receive(:puts).with("ドローしませんでした")
        player.player_action(deck)
      end
    end

    context "yが入力された時" do
      it "カードを引く" do
        allow(STDIN).to receive(:gets).and_return "a"
        expect(STDOUT).to receive(:puts).with("ドローしますか? y/n")
        expect(STDOUT).to receive(:puts).with("無効な文字列が入力されました、再度入力してください y/n")
        player.player_action(deck)
      end
    end
  end
end
