require "dealer"
require "player"
require "deck"
require "spec_helper"

describe Dealer do
  let(:dealer) { Dealer.new }
  let(:player) { Player.new(Card.new("♠", "A"), Card.new("♠", "2")) }

  describe "#deal" do

    before do
      dealer.deck.instance_variable_set(:@cards, ["♠A", "♠2", "♠3"])
      dealer.instance_variable_set(:@hand_cards, [])
    end

    context "配る相手が自分の手札の場合" do
      it "カードを手札に配る" do
        expect(dealer.deal(dealer.hand_cards)).to eq ["♠A"]
      end
    end

    context "配る相手がplayerの手札の場合" do
      it "カードを手札に配る" do
        player.instance_variable_set(:@hand_cards, [])
        expect(dealer.deal(player.hand_cards)).to eq ["♠A"]
      end
    end
  end


  describe "#show-first_card" do
    it "手札の一枚目を表示する" do
      dealer.instance_variable_set(:@hand_cards, [Card.new("♠", "A")])
      expect(dealer.show_first_card).to eq "♠A"
    end
  end
end
