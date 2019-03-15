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

  # 手札カードの数字を得点に変換
  def convert_total_score
    # 得点を入れていく配列
    user_score = []
    # 手札の要素数分、繰り返す
    hand_cards.each do |card|
      # 数字が10以下の時
      if card.number < 10
        # そのままの数値を格納する
        user_score.push(card.number)
      # 数字が10より大きい時
      else
        # 10を格納する
        user_score.push(10)
      end
    end
    # 変換した値の合計得点を返す
    user_score.sum
  end

  # 手札を表示する
  def show_hand_cards
    # 表示するための配列
    view = []
    # 手札の要素数分、繰り返す
    hand_cards.each do |card|
      # カードの柄を取得
      suit = card.suit
      # カードの数字を取得
      number = card.convert_num
      # 柄と数字を足したものを格納
      view.push("#{suit}"+"#{number}")
    end
    view
  end
end
