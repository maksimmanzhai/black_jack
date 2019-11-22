# frozen_string_literal: true

# class for creating rule of Game
class Game
  def counting_results(user, dealer)
    user_score = user.hands.scoring
    dealer_score = dealer.hands.scoring
    if user_score == dealer_score
      result = 'Draw'
      user.gain(10)
      dealer.gain(10)
    end
    if ((user_score > dealer_score && user_score < 21) || user_score == 21) || dealer_score > 21
      result = "#{user.name} win"
      user.gain(20)
    end
    if (user_score < dealer_score) || user_score > 21
      result = "#{dealer.name} win"
      dealer.gain(20)
    end
    $interface.show_result(result)
  end
end
