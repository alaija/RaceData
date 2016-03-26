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
#import "AnalyticsServiceImplementation.h"

@implementation ServiceComponentsAssembly

- (id <LocationService>)locationService {
    return [TyphoonDefinition withClass:[LocationServiceImplementation class]];
}

- (id <MotionService>)motionService {
    return [TyphoonDefinition withClass:[MotionServiceImplementation class]];
}

- (id <AnalyticsService>)analyticsService {
    return [TyphoonDefinition withClass:[AnalyticsServiceImplementation class] configuration:^(TyphoonDefinition *definition) {
        definition.scope = TyphoonScopeSingleton;
    }];
}

@end
