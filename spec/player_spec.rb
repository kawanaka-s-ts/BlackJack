require "player"
require "deck"
require "spec_helper"

describe Player do
  let(:player) { Player.new(Card.new("♠", "A"), Card.new("♠", "2")) }
  let(:deck) { Deck.new }

  describe "#player_action" do
    context "y, y, a ,nの順番で入力された時" do
      it "カードを2枚引く" do
        player.instance_variable_set(:@hand_cards, [])
        allow(STDIN).to receive(:gets).and_return "y", "y", "a", "n"
        expect(STDOUT).to receive(:puts).with("ドローしますか? y/n")
        expect(STDOUT).to receive(:puts).with("ドローします")
        expect(STDOUT).to receive(:puts).with("現在の手札は[\"♠A\"]です")
        expect(STDOUT).to receive(:puts).with("もう一度ドローしますか? y/n")
        expect(STDOUT).to receive(:puts).with("ドローします")
        expect(STDOUT).to receive(:puts).with("現在の手札は[\"♠A\", \"♠2\"]です")
        expect(STDOUT).to receive(:puts).with("もう一度ドローしますか? y/n")
        expect(STDOUT).to receive(:puts).with("入力は無効です、再度入力してください y/n") 
        expect(STDOUT).to receive(:puts).with("ドローしませんでした") 
        expect(STDOUT).to receive(:puts).with("現在の手札は[\"♠A\", \"♠2\"]です")
        player.player_action(deck)
      end
    end
  end
end
