require "user_base"

class Player < UserBase
  attr_accessor :hand_cards

  def initialize(first_card, second_card)
    @hand_cards = [first_card, second_card]
  end

  # プレーヤーの動作
  def player_action(deck)
    puts "ドローしますか? y/n"
    # 入力がある間繰り返す
    while action = STDIN.gets.chomp
      # nが入力されたら処理を抜ける
      break if action == "n"
      # yが入力された時
      if action == "y"
        puts "ドローします"
        # カードを引く
        draw(deck)
        puts "現在の手札は#{show_hand_cards}です"
        puts "もう一度ドローしますか? y/n"
      # y,n以外の文字が入力された時
      else
        puts "入力は無効です、再度入力してください y/n"
      end
    end
    puts "ドローしませんでした"
    puts "現在の手札は#{show_hand_cards}です"
    hand_cards
  end
end
