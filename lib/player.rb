require_relative "user_base"

class Player < UserBase
  attr_accessor :hand_cards

  def initialize(first_card, second_card)
    @hand_cards = [first_card, second_card]
  end

  # プレーヤーの動作
  def action(deck)
    puts "ドローしますか? y/n"
    action = STDIN.gets.chomp
    # 入力がyの時
    if action == "y"
      puts "ドローします"
      # ドローする
      draw(deck)
      puts "現在の手札は #{show_hand_cards} です"
      # trueを返す
      return true
    # 入力がnの時
    elsif action == "n"
      puts "ドローしませんでした"
      # falseを返す
      return false
    # 入力がyでもnでもない時
    else
      puts "無効な文字列が入力されました、再度入力してください y/n"
      # trueを返す
      return true
    end
  end
end
