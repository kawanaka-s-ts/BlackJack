require "player"
require "user_base"
require "deck"
require "spec_helper"

describe Player do
  let(:player) { Player.new }
  let(:deck) { Deck.new }

  describe "#player_action" do

    context "yが入力された時" do
      it "カードを引き、手札を表示する" do
        allow(STDIN).to receive(:gets).and_return "y", "y", "n"
        expect(STDOUT).to receive(:puts).with("ドローしますか?")
        expect(STDOUT).to receive(:puts).with("ドローします")
        expect(STDOUT).to receive(:puts).with("現在の手札は[\"♠A\"]です")
        expect(STDOUT).to receive(:puts).with("もう一度ドローしますか?")
        expect(STDOUT).to receive(:puts).with("ドローします")
        expect(STDOUT).to receive(:puts).with("現在の手札は[\"♠A\", \"♠2\"]です")
        expect(STDOUT).to receive(:puts).with("もう一度ドローしますか?")
        expect(STDOUT).to receive(:puts).with("ドローしませんでした") 
        expect(STDOUT).to receive(:puts).with("現在の手札は[\"♠A\", \"♠2\"]です")
        player.player_action(deck)
      end
    end
  end
end
