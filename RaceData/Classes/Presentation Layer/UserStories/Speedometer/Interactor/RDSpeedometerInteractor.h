//
//  RDSpeedometerInteractor.h
//  RaceData
//
//  Created by alaija on 09/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import "RDSpeedometerInteractorInput.h"
#import "LocationService.h"

@protocol RDSpeedometerInteractorOutput;

@interface RDSpeedometerInteractor : NSObject <RDSpeedometerInteractorInput>

@property (nonatomic, strong) NSObject<LocationService> *locationService;

@property (nonatomic, weak) id<RDSpeedometerInteractorOutput> output;

@end