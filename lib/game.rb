require_relative "deck"
require_relative "player"
require_relative "dealer"
require_relative "black_jack"

class Game < BlackJack
  attr_accessor :deck, :player, :dealer
  def initialize
    # 山札を作成
    @deck = Deck.new
    @player = Player.new(*@deck.cards.shift(2))
    @dealer = Dealer.new(*@deck.cards.shift(2))
  end

  def play_game
    puts "ゲームを開始します"
    puts "プレイヤーの手札は #{player.show_hand_cards} です"
    puts "プレイヤーの得点は #{total_score(player.hand_cards)} です"
    puts "ディーラーの手札の1枚目は #{dealer.show_first_card} です"
    puts "プレイヤーの番です"
    while player.player_action(deck)
      break if false
      puts "プレイヤーの得点は #{total_score(player.hand_cards)} です"
      return puts "バーストしました、敗北です" if burst?(player.hand_cards)
    end
    puts "勝負します"
    dealer.dealer_action(deck)
    puts "ディーラーの手札は #{dealer.show_hand_cards} でした"
    puts "ディーラーの得点は #{total_score(player.hand_cards)} です" 
    return puts "ディーラーがバーストしました、勝利です" if burst?(dealer.hand_cards) 
    puts "プレイヤーの合計は #{total_score(player.hand_cards)} です ディーラーの合計は #{total_score(dealer.hand_cards)} です"
    puts "#{decision(player, dealer)}です"
  end
end

Game.new.play_game
