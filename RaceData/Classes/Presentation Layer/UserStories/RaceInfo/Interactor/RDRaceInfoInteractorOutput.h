//
//  RDRaceInfoInteractorOutput.h
//  RaceData
//
//  Created by alaija on 12/12/2015.
//  Copyright 2015 RaceData. All rights reserved.
//

#import <Foundation/Foundation.h>

@import UIKit;

@protocol RDRaceInfoInteractorOutput <NSObject>

- (void)didSetUpManagers;
- (void)motionStarted;
- (void)speedChanged:(CGFloat)newSpeed;

@end