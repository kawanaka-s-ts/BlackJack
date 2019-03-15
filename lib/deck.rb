require "card"

class Deck
  attr_accessor :cards
  def initialize
    @cards = []
    build
  end
  
  # 定数SUITに柄を代入
  SUIT = ["♠", "♥", "♦", "♣"]
  # 定数RANKにランクを代入
  RANK = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
  # 52枚のカードを持った山札を作成
  def build
    # 図柄とランクを組み合わせる
    SUIT.product(RANK) do |s, r|
      # カードを作成し格納（引数に図柄と数字を渡す）
      cards << Card.new(s, r)
    end
  end

  def drawCard
    # 山札の先頭の要素を削除し、取り出す
    cards.shift
  end
end
