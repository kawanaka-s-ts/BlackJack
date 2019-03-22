require_relative "user_base"

class Dealer < UserBase
  attr_accessor :hand_cards

  def initialize(first_card, second_card)
    @hand_cards = [first_card, second_card]
  end

  # 手札の一枚目のみを表示する
  def show_first_card
    # cardは手札の1枚目
    card = hand_cards[0]
    suit = card.suit
    rank = card.rank
    ("#{suit}#{rank}")
  end
end
