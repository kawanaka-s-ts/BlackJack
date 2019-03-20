require_relative "user_base"

class Player < UserBase
  attr_accessor :hand_cards

  def initialize(first_card, second_card)
    @hand_cards = [first_card, second_card]
  end

  # プレーヤーの動作
  def player_action(deck)
    puts "ドローしますか? y/n"
    action = STDIN.gets.chomp
    if action == "y"
      puts "ドローします"
      draw(deck)
      puts "現在の手札は #{show_hand_cards} です"
      return true
    elsif action == "n"
      puts "ドローしませんでした"
      return false
    else
      puts "無効な文字列が入力されました、再度入力してください y/n"
      return true
    end
  end
end
