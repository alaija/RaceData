//
//  RDRaceInfoInteractor.h
//  RaceData
//
//  Created by alaija on 12/12/2015.
//  Copyright 2015 RaceData. All rights reserved.
//

#import <CoreMotion/CoreMotion.h>

#import "RDRaceInfoInteractorInput.h"
#import "LocationService.h"
#import "MotionService.h"
#import "SettingsService.h"

@protocol RDRaceInfoInteractorOutput;

@interface RDRaceInfoInteractor : NSObject <RDRaceInfoInteractorInput>

@property (nonatomic, strong) NSObject<LocationService> *locationService;
@property (nonatomic, strong) NSObject<MotionService> *motionService;
@property (nonatomic, strong) id<SettingsService> settingsService;

@property (nonatomic, weak) id<RDRaceInfoInteractorOutput> output;

@end