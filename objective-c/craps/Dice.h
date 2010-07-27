//
//  dice.h
//  craps
//
//  Created by Clayton Lengel-Zigich on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


@interface Dice : NSObject
  {
    NSArray *loadedDice;
    NSInteger *rollCount;
  }

  @property(assign) NSArray *loadedDice;
  @property(assign) NSInteger *rollCount;

  - (NSArray *) roll;


@end // Dice
