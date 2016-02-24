//
//  MotionServiceImplementation.m
//  RaceData
//
//  Created by Alan Kochev on 09/01/16.
//  Copyright © 2016 Alan Kochev. All rights reserved.
//

#import "MotionServiceImplementation.h"
#import <CoreMotion/CoreMotion.h>

@interface MotionServiceImplementation()

@property (nonatomic, strong) CMMotionManager *motionManager;

@property (nonatomic) CGFloat currentAcceleration;
@end

@implementation MotionServiceImplementation

- (instancetype)init
{
    self = [super init];
    if (self) {
        _motionManager = [CMMotionManager new];
        _motionManager.accelerometerUpdateInterval = 0.01;
    }
    return self;
}


- (void)handleMotionData:(CMAcceleration)acceleration
{
    self.currentAcceleration = sqrt((pow(acceleration.x, 2) + pow(acceleration.y, 2) + pow(acceleration.z, 2)));
}

- (void)startUpdates
{
    [_motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue new]
                                             withHandler:^(CMAccelerometerData * _Nullable accelerometerData,
                                                           NSError * _Nullable error) {
                                                 if (!error)
                                                 {
                                                     [self handleMotionData:accelerometerData.acceleration];
                                                 }
                                             }];
}

- (void)stopUpdates
{
    [_motionManager stopAccelerometerUpdates];
}

@end
