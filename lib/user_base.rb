class UserBase
  attr_accessor :hand_cards

  def initialize
    @hand_cards = []
  end

  # 引いたカードを手札に加える
  def draw(deck)
    # 手札に加える（渡されるのは、山札の先頭の要素）
    hand_cards.push(deck.drawCard)
  end

  # 手札を表示する
  def show_hand_cards
    # 表示するための配列
    view = []
    # 手札の要素数分、繰り返す
    hand_cards.each do |card|
      # カードの柄を取得
      suit = card.suit
      # カードのランクを取得
      rank = card.rank
      # 柄とランクを足したものを格納
      view.push("#{suit}#{rank}")
    end
    view
  end
end
