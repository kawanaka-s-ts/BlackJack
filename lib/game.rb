require "deck"
require "player"
require "dealer"
require "black_jack"

class Game < BlackJack
  attr_accessor :deck, :player, :dealer
  def initialize
    # 山札を作成
    @deck = Deck.new
    # 山札をシャッフル
    @deck.shuffle
    @player = Player.new(*@deck.cards.shift(2))
    @dealer = Dealer.new(*@deck.cards.shift(2))
  end

  def play_game
    puts "ゲームを開始します"
    puts "プレイヤーの手札は#{player.show_hand_cards}"
    puts "ディーラーの手札の1枚目は#{dealer.show_hand_cards}"
    puts "プレイヤーの番です"
    player.player_action(deck)
    puts "勝負です"
    dealer.dealer_action(deck)
    puts "ディーラーの手札は#{dealer.show_hand_cards}でした"
    puts "プレイヤーの合計は #{convert_total_score(player.)} です,ディーラーの合計は #{convert_total_score(dealer)}"
    puts "#{decision(player, dealer)}です"
  end
end
