class UserBase
  attr_accessor :hand_cards

  def initialize
    @hand_cards = []
  end

  # 引いたカードを手札に加える
  def draw(deck)
    # 手札に加える（渡されるのは、山札の先頭の要素）
    hand_cards.push(deck.draw_card)
  end

  # 手札を表示する
  def show_hand_cards
    # 手札の要素数分、繰り返す
    hand_cards.map do |card|
      card.display
    end
    .join(" , ")
  end
end
