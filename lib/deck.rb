class Deck
  
  # 52枚のカードを持った山札を作成
  def build
    cards = []
    # 図柄と数字を組み合わせる
    ['♠', '♥', '♦', '♣'].product([*1..13]) do |s, n|
      # カードの作成（引数に図柄と数字を渡す）
      cards << Card.new(s, n)
    end
    # 山札を返す
    cards
  end
end
