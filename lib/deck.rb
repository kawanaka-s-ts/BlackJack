class Deck
  attr_reader :cards
  def initialize
    # カードの束
    @cards = []
  end
  
  # 52枚のカードを持った山札を作成
  def build
    # 図柄と数字を組み合わせる
    ['♠', '♥', '♦', '♣'].product([*1..13]) do |s, n|
      # カードの作成（引数に図柄と数字を渡す）
      card = Card.new(s, n)
      # 作成したカードを山札に格納
      cards << card.show_card
    end
    # 山札を返す
    cards
  end
end
