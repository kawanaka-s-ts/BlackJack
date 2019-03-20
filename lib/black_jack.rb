class BlackJack

  # 手札カードの数字を得点に変換
  def total_score(cards)
    # 手札の要素を合計する
    cards.sum do |card|
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

  # バーストしたかを確認する
  def burst?(cards)
    total_score(cards) > 21
  end

  # 勝敗判定の実装
  def decision(player, dealer)
    player_score = total_score(player.hand_cards)
    dealer_score = total_score(dealer.hand_cards)
    # player_scoreとdealer_scoreをUFO演算子で比較する
    case player_score <=> dealer_score
    # 結果が1の時、勝利と返す
    when 1 then "勝利"
    # 結果が-1の時、敗北と返す
    when -1 then "敗北"
    # それ以外の時、引き分けと返す
    else
       "引き分け"
    end
  end
end
