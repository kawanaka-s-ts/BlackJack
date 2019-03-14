class Card
  attr_accessor :suit, :number
  def initialize(suit, number)
    @suit = suit
    @number = number
  end

  # カードの柄と数字を取得する
  def show_card
    ("#{suit}""#{number}")
  end

  # カードの数字を取得する
  def show_number
    number
  end
end
