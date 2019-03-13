class UserBase
  def initialize
    @hand_cards = []
  end

  # 引いたカードを手札に加える
  def draw(deck)
    # 手札に加える（渡されるのは、山札の先頭の要素）
    @hand_cards.push(deck.drawCard)
  end
end
