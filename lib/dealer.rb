require "user_base"
require "pry"

class Dealer < UserBase
  attr_accessor :hand_cards

  def initialize(first_card, second_card)
    @hand_cards = [first_card, second_card]
  end

  # dealerの動作
  def dealer_action(deck)
    score = []
    # dealerの得点が17を超えるまで繰り返す
    while score.sum < 17
      score = []
      # ドローする
      draw(deck)
      # 手札の最後の要素を取り出す
      hand_cards.each do |card|
        case card.rank
        # rankが"J", "Q", "K"の時
        when "J", "Q", "K"
          # 10を格納する
          score.push(10)
        # rankが"A"の時
        when "A"
          # 1を格納する
          score.push(1)
        # 上記以外の場合
        else 
          # rankを数値にしたものを格納する
          score.push(card.rank.to_i)
        end
      end
    end
    score.sum
  end

  # 手札の一枚目のみを表示する
  def show_first_card
    # cardは手札の1枚目
    card = hand_cards[0]
    suit = card.suit
    rank = card.rank
    ("#{suit}#{rank}")
  end
end
