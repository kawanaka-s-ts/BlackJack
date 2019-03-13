require "card"

class Deck
  attr_accessor :cards
  def initialize
    @cards = []
    build
  end

  # 52枚のカードを持った山札を作成
  def build
    # 図柄と数字を組み合わせる
    ['♠', '♥', '♦', '♣'].product([*1..13]) do |s, n|
      # カードを作成し格納（引数に図柄と数字を渡す）
      cards << Card.new(s, n)
    end
  end

  def drawCard
    # 山札の先頭の要素を削除し、取り出す
    cards.shift
  end
end
