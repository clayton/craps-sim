class Result
  attr_accessor :shooter, :details

  def initialize(args)
    @shooter = args[:shooter]
    @details = setup_details
  end

  def self.headers
    ["Points Made", "Comeout Wins", "Comeout Losses", "Numbers Rolled", "Outcome"]
  end

  def self.display(results)
    max_len = headers.map{|h| h.length }.max

    header_row = "| " + headers.map{|h| h.ljust(max_len, " ") }.join(" | ") + " |"
    puts "-" * header_row.length
    puts header_row
    puts "-" * header_row.length
    for result in results do
      puts "| " + result.tabular_form(max_len) + " | "
    end
    puts "-" * header_row.length
  end

  def tabular_form(max_len)
    details.map{|d| d.to_s.ljust(max_len, " ") }.join(" | ")
  end

  def setup_details
     [
      @shooter.points_hit,
      @shooter.comeout_wins,
      @shooter.comeout_losses,
      @shooter.numbers_rolled.size,
      outcome(@shooter)
     ]
  end

private
  def outcome(shooter)
    diff = (shooter.starting_bankroll - shooter.bankroll).abs
    return "win $#{diff}"  if shooter.bankroll >= shooter.starting_bankroll
    return "loss ($#{diff})" if shooter.bankroll < shooter.starting_bankroll
  end


end