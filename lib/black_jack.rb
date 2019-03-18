class BlackJack

  # 手札カードの数字を得点に変換
  def convert_total_score(user)
    # 手札の要素を合計する
    user.hand_cards.sum do |card|
      case card.rank
      # rankが"J", "Q", "K"の時
      when "J", "Q", "K"
        # 10として扱う
        10
      # rankが"A"の時
      when "A"
        # 1として扱う
        1
      # 上記以外の場合
      else 
        # rankを数値にする
        card.rank.to_i
      end
    end
  end

  # 勝敗判定の実装
  def decision(player, dealer)
    player_score = convert_total_score(player)
    dealer_score = convert_total_score(dealer)
    # playerの手札の合計が21を超えた場合
    if player_score > 21
      '敗北'
    # dealerの手札の合計が21を超えた場合
    elsif dealer_score > 21
      '勝利' 
    # playerの手札の合計が相手より高い場合
    elsif (21 - player_score) < (21 - dealer_score)
      '勝利' 
    # playerとdealerの手札の合計が同じ場合
    elsif (21 - player_score) == (21 - dealer_score)
      '引き分け'
    end
  end
end
