require 'lib/dealer.rb'
require 'lib/shooter.rb'
require 'lib/dice.rb'
require 'lib/game.rb'
require 'lib/result.rb'
require 'lib/craps.rb'

# require 'rubygems'
# require 'ruby-debug'

c = Craps.new({:bet => 10, :odds => 1})
c.play