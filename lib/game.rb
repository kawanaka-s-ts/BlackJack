require_relative "deck"
require_relative "player"
require_relative "dealer"
require_relative "black_jack"

class Game < BlackJack
  attr_accessor :deck, :player, :dealer
  def initialize
    @dealer = Dealer.new
    @player = Player.new(*@dealer.deck.cards.shift(2))
  end

  def play_game
    puts "ゲームを開始します"
    puts "プレイヤーの手札は #{player.show_hand_cards} です"
    puts "プレイヤーの得点は #{total_score(player.hand_cards)} です"

    # playerとdealerのどちらもブラックジャックの場合
    if black_jack?(total_score(player.hand_cards)) && black_jack?(total_score(dealer.hand_cards))
      puts "ディーラーの手札は #{dealer.show_hand_cards} でした"
      puts "ディーラーの得点は #{total_score(dealer.hand_cards)} です"
      puts "どちらもブラックジャックです"
      return puts "敗北です"
    # playerがブラックジャックだった時の処理
    elsif black_jack?(total_score(player.hand_cards))
      puts "プレイヤーはブラックジャックです"
      puts "ディーラーの手札は #{dealer.show_hand_cards} でした"
      puts "ディーラーの得点は #{total_score(dealer.hand_cards)} です"
      return puts "勝利です"
    end

    puts "ディーラーの手札の1枚目は #{dealer.show_first_card} です"
    puts "プレイヤーの番です"
    while player_action(dealer, player)
      puts "プレイヤーの得点は #{total_score(player.hand_cards)} です"
      return puts "バーストしました、敗北です" if burst?(total_score(player.hand_cards))
    end
    puts "勝負します"

    # dealerがブラックジャックだった時の処理
    if black_jack?(total_score(dealer.hand_cards))
      puts "ディーラーの手札は #{dealer.show_hand_cards} でした"
      puts "ディーラーの得点は #{total_score(dealer.hand_cards)} です"
      puts "ディーラーはブラックジャックです"
      return puts "敗北です"
    end

    dealer_action(dealer)
    puts "ディーラーの手札は #{dealer.show_hand_cards} でした"
    puts "ディーラーの得点は #{total_score(dealer.hand_cards)} です"
    return puts "ディーラーがバーストしました、勝利です" if burst?(total_score(dealer.hand_cards))
    puts "プレイヤーの合計は #{total_score(player.hand_cards)} です ディーラーの合計は #{total_score(dealer.hand_cards)} です"
    puts "#{decision(player, dealer)}です"
  end
end

if __FILE__ == $0
  Game.new.play_game
end
