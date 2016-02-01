//
//  RDGPSInteractor.h
//  RaceData
//
//  Created by alaija on 01/02/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import "RDGPSInteractorInput.h"
#import "LocationService.h"

@protocol RDGPSInteractorOutput;

@interface RDGPSInteractor : NSObject <RDGPSInteractorInput>

@property (nonatomic, strong) NSObject<LocationService> *locationService;

@property (nonatomic, weak) id<RDGPSInteractorOutput> output;

@end