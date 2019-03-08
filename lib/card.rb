class Card
  attr_accessor :numbers, :suit_num
  def initialize
    # カードの数値
    @numbers = [*1..13]
    # 図柄ごとの番号
    @suit_num = [1, 2, 3, 4]
  end
end
