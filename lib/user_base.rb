class UserBase
  attr_accessor :hand_cards
  def initialize
    @hand_cards = []
  end

  # 山札からカードを引く
  def draw(cards)
    # deckの先頭の値を手札に入れる
    hand_cards.push(cards[0])
    # deckの先頭の値を削除する(手札に入ったので)
    cards.delete(cards[0])
    hand_cards
  end
end
