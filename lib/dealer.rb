class Dealer
  def point_made?(roll, point)
    return true if roll == point
  end

  def seven_out?(roll)
    return true if roll == 7
  end

  def seven_eleven?(roll)
    return true if [7,11].include?(roll)
  end

  def craps?(roll)
    return true if [2,3,12].include?(roll)
  end

  def point_established?(roll)
    return true if [4,5,6,8,9,10].include?(roll)
  end

  def pay(shooter, roll)
    LOGGER.debug("\t[INFO] Shooter had $#{shooter.bankroll}")
    if shooter.coming_out?
      shooter.bankroll += (shooter.active_bet) * 2
      LOGGER.debug("\t[INFO] Shooter paid $#{shooter.active_bet} $(#{shooter.bankroll})")
    else
      shooter.bankroll += (shooter.active_bet * 2) + (shooter.active_odds + odds_payout(shooter.active_odds, roll))
      LOGGER.debug("\t[INFO] Shooter paid $#{(shooter.active_bet) + (odds_payout(shooter.active_odds, roll))} $(#{shooter.bankroll})")
    end
    clear_bets(shooter)
    LOGGER.debug("\t[INFO] Shooter has $#{shooter.bankroll}")
  end

  def clear_bets(shooter)
    shooter.active_bet  = 0
    shooter.active_odds = 0
  end

private
  def odds_payout(odds,roll)
    case roll
    when 6,8
      (odds / 5) * 6
    when 5,9
      (odds / 2) * 3
    when 4,10
      odds * 2
    else
      0
    end
  end
end