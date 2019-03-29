require_relative "player"

class Dealer < Player
  attr_accessor :hand_cards, :deck

  # dealerは手札とデッキを持つ
  def initialize
    @deck = Deck.new
    @hand_cards = @deck.cards.shift(2)
  end

  # カードを渡す
  def deal(hand_cards)
    hand_cards.push(deck.draw_card)
  end

  # 手札の一枚目のみを表示する
  def show_first_card
    # cardは手札の1枚目
    hand_cards[0].display
  end
end
