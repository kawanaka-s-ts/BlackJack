class UserBase
  attr_accessor :hand_cards
  def initialize
    @hand_cards = []
  end

  # 山札からカードを引く
  def draw(deck)
    # deckの先頭の値を手札に入れる
    hand_cards.push(deck[0])
    # deckの先頭の値を削除する(手札に入ったので)
    deck.delete(deck[0])
  end

  # 手札を表示するメソッド
  def show_card(hand_cards)
    # hand_card[0]の値によって条件分岐
    case hand_cards[0]
    # 1の時、nameに"♠"を代入
    when 1 then name = "♠"
    # 2の時、nameに"♥"を代入
    when 2 then name = "♥"
    # 3の時、nameに"♦"を代入
    when 3 then name = "♦"
    # 3の時、nameに"♣"を代入
    when 4 then name = "♣"
    end

    # hand_card[1]の値によって条件分岐
    case hand_cards[1]
    # 1の時、nameに"A"を代入 
    when 1 then name += "A"
    # 11の時、nameに"A"を代入 
    when 11 then name += "J"
    # 12の時、nameに"A"を代入 
    when 12 then name += "Q"
    # 13の時、nameに"A"を代入 
    when 13 then name += "K"
    # それ以外の時、nameにを代入 
    else
      name += hand_cards[1].to_s
    end
    name
  end
end
