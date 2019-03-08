require "card"

class Deck < Card
  # ゲームに使用するdeckを作成する
  def create_deck
    deck = []
    # 図柄の要素数分、処理を繰り返す
    suit_num.each do |suit|
      # 数字の要素数分、処理を繰り返す
      numbers.each do |num|
        # 図柄の番号、数字の2つの要素を持った配列をdeckに入れる
        deck.push([suit, num])
      end
    end
    # 52枚のカードの入ったdeckを返す
    deck
  end

  # deckをシャッフルする
  def shuffle_deck(deck)
    deck.shuffle!
  end
end
