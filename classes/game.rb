class Game
  def counting_results(user, dealer)
    user.hands.scoring
    dealer.hands.scoring
    if user.hands.score == dealer.hands.score
      result = 'Draw'
      user.gain(10)
      dealer.gain(10)
    end
    if ((user.hands.score > dealer.hands.score && user.hands.score < 21) || user.hands.score == 21) || dealer.hands.score > 21
      result = "#{user.name} win"
      user.gain(20)
    end
    if (user.hands.score < dealer.hands.score) || user.hands.score > 21
      result = "#{dealer.name} win"
      dealer.gain(20)
    end
    $interface.show_result(result)
  end
end
