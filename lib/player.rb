class Player
  attr_accessor :hand_cards

  def initialize(first_card, second_card)
    @hand_cards = [first_card, second_card]
  end

  # 手札を表示する
  def show_hand_cards
    # 手札の要素数分、繰り返す
      hand_cards.map do |card|
      card.display
    end.join(" , ")
  end
end
