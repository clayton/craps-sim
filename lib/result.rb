class Result
  attr_accessor :point, :shooter, :details

  def initialize(args)
    @point   = args[:point]
    @shooter = args[:shooter]
    @details = setup_details
  end

  def self.headers
    ["Point", "Comeout Wins", "Comeout Losses", "Numbers Rolled", "Numbers", "Outcome"]
  end

  def self.display(results)
    max_result_len = results.map{|r| r.details[4].length }.compact.max
    max_header_len = headers.map{|h| h.length }.max
    max_len = ((max_header_len > max_result_len) ? max_header_len : max_result_len)

    puts "| " + headers.map{|h| h.ljust(max_len, " ") }.join(" | ") + " |"
    for result in results do
      puts "| " + result.tabular_form(max_len) + " | "
    end
  end

  def tabular_form(max_len)
    details.map{|d| d.to_s.ljust(max_len, " ") }.join(" | ")
  end

  def setup_details
     [
      @point,
      @shooter.comeout_wins,
      @shooter.comeout_losses,
      @shooter.numbers_rolled.size,
      @shooter.numbers_rolled.join(", "),
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