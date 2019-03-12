class Deck
  attr_accessor :numbers, :suit, :cards
  def initialize
    # カードの数値
    @numbers = [*1..13]
    # 図柄
    @suit = ['♠', '♥', '♦', '♣']
    # カードの束
    @cards = []
  end

  # カードを作成する
  def create_cards
    cards = suit.product(numbers)
  end
end
