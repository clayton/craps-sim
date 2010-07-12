class Game
  attr_accessor :shooter, :dice, :dealer, :point

  def initialize(args)
    @point   = nil
    @shooter = Shooter.new({:bet => args[:bet], :odds => args[:odds]})
    @dealer  = Dealer.new
  end

  def start
    puts "[INFO] Starting New Game #{Time.now.to_i}"
    while dice_out
      if @point
        while @shooter.still_shooting? && @shooter.has_bankroll?
          proceed
        end
        puts "\t[INFO] Roll Ended, Shooter has $#{shooter.bankroll}"
        break
      end
    end
    Result.new({:point => @point, :shooter => @shooter})
  end

private

  def proceed
    roll = @shooter.shoot
    puts "\t[INFO] Shooter rolls a #{roll}"
    if @dealer.point_made?(roll, @point)
      @dealer.pay(@shooter, roll)
      @shooter.still_shooting = false
      puts "\t[WIN]  Shooter hits their point of #{roll} $(#{@shooter.bankroll})"
    elsif @dealer.seven_out?(roll)
      @dealer.clear_bets(@shooter)
      @shooter.still_shooting = false
      puts "\t[LOSS] Shooter sevens out $(#{@shooter.bankroll})"
    else
      @shooter.numbers_rolled << roll
      @shooter.still_shooting = true
    end
  end

  def dice_out
    roll = @shooter.comeout
    puts "\t[INFO] Shooter rolls a #{roll}"

    if @dealer.point_established?(roll)
      @shooter.coming_out = false
      puts "\t[INFO] Shooter Establishes a Point of #{roll}"
      @point = roll
    end

    if @dealer.seven_eleven?(roll)
      @shooter.comeout_wins += 1
      @dealer.pay(@shooter, roll)
      puts "\t[WIN]  Seven Eleven! $(#{@shooter.bankroll})"
    end

    if @dealer.craps?(roll)
      @shooter.comeout_losses += 1
      @dealer.clear_bets(@shooter)
      puts "\t[LOSS] Craps! $(#{@shooter.bankroll})"
    end
    @shooter.still_shooting = true
    return true
  end

end