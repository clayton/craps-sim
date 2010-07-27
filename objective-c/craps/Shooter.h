//
//  Shooter.h
//  craps
//
//  Created by Clayton Lengel-Zigich on 7/27/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Dice.h"


//:bankroll, :bet, :odds, :dice, :coming_out,
//:still_shooting, :active_bet, :active_odds,
//:comeout_losses, :comeout_wins, :numbers_rolled,
//:starting_bankroll, :points_hit


@interface Shooter : NSObject 
{
  NSInteger *bankroll;
  NSInteger *bet;
  NSInteger *odds;
  Dice      *theseDice;
  Boolean   *coming_out;
  Boolean   *still_shooting;
}

@end
