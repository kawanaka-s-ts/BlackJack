class BlackJack
  # 勝敗判定の実装
  def decision(player_cards, dealer_cards)
    # playerの手札の合計が21を超えた場合
    if player_cards.inject(:+) > 21
      '敗北'
    # playerの手札の合計が相手より高い場合
    elsif (21 - player_cards.inject(:+)) < (21 - dealer_cards.inject(:+))
      '勝利' 
    # playerとdealerの手札の合計が同じ場合
    elsif (21 - player_cards.inject(:+)) == (21 - dealer_cards.inject(:+))
      '引き分け'
    end
  end
end
