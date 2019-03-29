class BlackJack

  # 手札カードの数字を得点に変換
  def total_score(cards)
    # 得点を入れる配列
    score = []
    # 手札の要素を合計する
    cards.each do |card|
      case card.rank
      # rankが"J", "Q", "K"の時
      when "J", "Q", "K"
        # 10として扱う
        score.push(10)
      # rankが"A"の時
      when "A"
        # 11として扱う
        score.push(11)
      # 上記以外の場合
      else 
        # rankを数値にする
        score.push(card.rank.to_i)
      end
    end
    # scoreの全要素を合計したものをtotal_scoreに代入する
    total_score = score.sum
    # 合計が21を超えていた場合
    if total_score > 21
      # countにAの数を代入
      count = ace_count(cards)
      # カウントが0になるまで繰り返す
      while count > 0
        # もしtotal_scoreが21を下回ったら処理を終わる
        break if total_score <= 21
        # scoreを10減らす
        total_score -= 10
        # countを減らす
        count -= 1
      end
      # 合計を返す
      total_score
    # 21を超えていなかった場合
    else
      # 合計をそのまま返す
      total_score
    end
  end

  # Aをカウントする
  def ace_count(cards)
    ace_count = 0
    # 要素数分繰り返す
    cards.each do |card|
      # rankがAの時、カウントを1増やす
      ace_count += 1 if card.rank == "A"
    end
    ace_count
  end

  # バーストしたかを確認する
  def burst?(cards)
    total_score(cards) > 21
  end

  # ブラックジャックかどうか確認する
  def black_jack?(cards)
    total_score(cards) == 21
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

  # dealerの動作
  def dealer_action(dealer)
    cards = dealer.hand_cards
    # dealerの得点が17を超えるまで繰り返す
    while total_score(cards) < 17
      dealer.deal(dealer.hand_cards)
    end
  end

  # プレーヤーの動作
  def player_action(dealer, player)
    puts "ドローしますか? y/n"
    action = STDIN.gets.chomp
    # 入力がyの時
    if action == "y"
      puts "ドローします"
      # ドローする
      dealer.deal(player.hand_cards)
      puts "現在の手札は #{player.show_hand_cards} です"
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
