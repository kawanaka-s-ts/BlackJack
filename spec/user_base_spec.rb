require "user_base"
require "spec_helper"

describe UserBase do
  let(:user_base){UserBase.new}

  describe "#draw" do
    cards = ["♠1", "♠2", "♠3", "♠4", "♠5"]
    it "山札の先頭の要素を手札に加える" do
      expect(user_base.draw(cards)).to eq ["♠1"]
    end
  end
end
