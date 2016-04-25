//
//  RDRaceInfoViewInput.h
//  RaceData
//
//  Created by alaija on 12/12/2015.
//  Copyright 2015 RaceData. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RDRaceInfoViewInput <NSObject>

@property (nonatomic) BOOL metricSystem;
@property (nonatomic) BOOL nightMode;

- (void)setupInitialState;

- (void)setupReadyToStartState;
- (void)setupRaceState;

- (void)updateSpeed:(CGFloat)speed;
- (void)updateMotionStartTime;

@end