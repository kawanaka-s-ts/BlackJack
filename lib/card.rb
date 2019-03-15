class Card
  attr_accessor :suit, :number
  def initialize(suit, number)
    @suit = suit
    @number = number
  end

  # カードの柄を取得する
  def show_suit
    suit
  end

  # カードの数字を取得する
  def show_number
    number
  end

  # カードの数字を変換する
  def convert_num
    # numberが1の時
    if number == 1
      "A"
    # numberが11の時
    elsif number == 11
      "J"
    # numberが12の時
    elsif number == 12
      "Q"
    # numberが13の時
    elsif number == 13
      "K"
    # それ以外の時
    else
      number
    end
  end
end
