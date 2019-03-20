require_relative "card"

class Deck
   # 定数SUIT_LISTに柄の一覧を代入
   SUIT_LIST = ["♠", "♥", "♦", "♣"]
   # 定数RANK_LISTにランクの一覧を代入
   RANK_LIST = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]

  attr_reader :cards

  def initialize
    @cards = []
    build
  end

  # 52枚のカードを持った山札を作成
  def build
    # 図柄とランクを組み合わせる
    SUIT_LIST.product(RANK_LIST) do |suit, rank|
      # カードを作成し格納（引数に図柄と数字を渡す）
      cards.push(Card.new(suit, rank))
    end
  end

  def draw_card
    # 山札の先頭の要素を削除し、取り出す
    cards.shift
  end

  def shuffle
    # カードをシャッフルする
    cards.shuffle!
  end
end
