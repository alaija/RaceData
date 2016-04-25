//
//  RDSpeedometerInteractorOutput.h
//  RaceData
//
//  Created by alaija on 09/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RDSettingsObject;

@protocol RDSpeedometerInteractorOutput <NSObject>

- (void)speedChanged:(CGFloat)speed;
- (void)updateSettings:(RDSettingsObject *)settings;

@end