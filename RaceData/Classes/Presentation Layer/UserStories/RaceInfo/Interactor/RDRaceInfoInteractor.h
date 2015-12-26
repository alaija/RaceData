//
//  RDRaceInfoInteractor.h
//  RaceData
//
//  Created by alaija on 12/12/2015.
//  Copyright 2015 RaceData. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <CoreMotion/CoreMotion.h>

#import "RDRaceInfoInteractorInput.h"

@protocol RDRaceInfoInteractorOutput;

@interface RDRaceInfoInteractor : NSObject <RDRaceInfoInteractorInput>

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CMMotionManager *motionManager;

@property (nonatomic, weak) id<RDRaceInfoInteractorOutput> output;

@end