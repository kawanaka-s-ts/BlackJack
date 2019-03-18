require "user_base"

class Player < UserBase
  attr_accessor :hand_cards

  def initialize(first_card, second_card)
    @hand_cards = [first_card, second_card]
  end

  # プレーヤーの動作
  def player_action(deck)
    puts "ドローしますか?"
    # 入力が
    while action = STDIN.gets
      # "nが入力されたら処理を抜ける"
      break if action == "n"
      puts "ドローします"
      # カードを引く
      draw(deck)
      puts "現在の手札は#{show_hand_cards}です"
      puts "もう一度ドローしますか?"
    end
    puts "ドローしませんでした"
    puts "現在の手札は#{show_hand_cards}です"
    hand_cards
  end
end
