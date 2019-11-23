# frozen_string_literal: true

# class for creating rule of Game
class Game
  def counting_results(user, dealer, interface)
    @user = user
    @dealer = dealer
    if draw?(user.hands.scoring, dealer.hands.scoring)
      draw
    elsif user_won?(user.hands.scoring, dealer.hands.scoring)
      user_victory
    elsif dealer_won?(user.hands.scoring, dealer.hands.scoring)
      dealer_victory
    end
    interface.show_result(@result)
  end

  def draw?(user, dealer)
    user == dealer
  end

  def draw
    @user.gain(10)
    @dealer.gain(10)
    @result = 'Draw'
  end

  def user_won?(user, dealer)
    ((user > dealer && user < 21) || user == 21) || dealer > 21
  end

  def user_victory
    @user.gain(20)
    @result = "#{@user.name} win"
  end

  def dealer_won?(user, dealer)
    (user < dealer) || user > 21
  end

  def dealer_victory
    @dealer.gain(20)
    @result = "#{@dealer.name} win"
  end
end
