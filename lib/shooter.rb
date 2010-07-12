class Shooter
  attr_accessor :bankroll, :bet, :odds, :dice, :coming_out,
                :still_shooting, :active_bet, :active_odds,
                :comeout_losses, :comeout_wins, :numbers_rolled,
                :starting_bankroll, :points_hit

  def initialize(args)
    @coming_out        = true
    @bet               = args[:bet] || 10
    @odds              = args[:odds] || 1
    @bankroll          = 200
    @starting_bankroll = 200
    @comeout_wins      = 0
    @comeout_losses    = 0
    @numbers_rolled    = []
    @points_hit        = 0
    @dice              = Dice.new
    @active_bet        = 0
    @active_odds       = 0
  end

  def comeout
    pass_line_bet unless @active_bet > 0
    @dice.roll
  end

  def shoot
    pass_line_odds unless @active_odds > 0
    @dice.roll
  end

  def still_shooting?
    still_shooting
  end

  def coming_out?
    coming_out
  end

  def has_bankroll?
    LOGGER.info("\t[INFO] $(#{bankroll})")
    return false if at_win_limit?
    return false if at_loss_limit?
    @bankroll > @bet && (@bankroll + @bet) > 0
  end

private

  def at_win_limit?
    true if self.bankroll >= 300
  end

  def at_loss_limit?
    false
  end

  def pass_line_bet
    @active_bet += @bet
    self.bankroll = @bankroll - @bet
    LOGGER.debug "\t[BET]  Shooter bets $#{@active_bet} ($#{@bankroll})"
  end

  def pass_line_odds
    total_odds_bet = @active_bet * @odds
    if @bankroll >= total_odds_bet
      @active_odds += @active_bet * @odds
      self.bankroll = @bankroll - @active_odds
    end
    LOGGER.debug "\t[BET]  Shooter lays $#{@active_odds} odds ($#{@bankroll})"
  end
end