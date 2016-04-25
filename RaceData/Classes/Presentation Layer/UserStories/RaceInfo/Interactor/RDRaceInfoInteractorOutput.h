//
//  RDRaceInfoInteractorOutput.h
//  RaceData
//
//  Created by alaija on 12/12/2015.
//  Copyright 2015 RaceData. All rights reserved.
//

@import UIKit;

@class RDSettingsObject;

@protocol RDRaceInfoInteractorOutput <NSObject>

- (void)didSetUpManagers;
- (void)updateSettings:(RDSettingsObject *)settings;

- (void)motionStarted;
- (void)speedChanged:(CGFloat)newSpeed;

@end