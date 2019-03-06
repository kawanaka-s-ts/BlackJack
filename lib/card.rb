class Card
  attr_reader :numbers, :suit, :suit_num, :deck
  def initialize
    # カードの数値
    @numbers = [*1..13]
    # 図柄ごとの番号
    @suit_num = [1, 2, 3, 4]
    # 空の山札
    @deck = []
  end

  # 山札にカードを格納
  def create_deck
    # suit_numのindexをiとして0を代入
    i = 0
    # iの値が要素数より小さい間繰り返す
    while i < suit_num.size
      # numbersのindexをjとして0を代入
      j = 0
      # iの値が要素数より小さい間繰り返す
      while j < numbers.size
        # 図柄の番号、数字の2つの要素を持った配列をdeckに入れる
        deck.push([suit_num[i] , numbers[j]])
        # jを1増やす
        j += 1
      end
      # iを1増やす
      i += 1
    end
    # 52枚のカードの入ったdeckを返す
    deck
  end

  def shuffle_deck(deck)
    deck.shuffle!
  end
end
