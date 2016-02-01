//
//  ServiceComponentsAssembly.m
//  RaceData
//
//  Created by Alan Kochev on 09/01/16.
//  Copyright © 2016 Alan Kochev. All rights reserved.
//

#import "ServiceComponentsAssembly.h"
#import "LocationServiceImplementation.h"
#import "MotionServiceImplementation.h"

@implementation ServiceComponentsAssembly

- (id <LocationService>)locationService {
    return [TyphoonDefinition withClass:[LocationServiceImplementation class]];
}

- (id <LocationService>)motionService {
    return [TyphoonDefinition withClass:[MotionServiceImplementation class]];
}

@end
