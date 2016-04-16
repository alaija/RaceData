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
#import "SettingsServiceImplementation.h"

@implementation ServiceComponentsAssembly

- (id <LocationService>)locationService {
    return [TyphoonDefinition withClass:[LocationServiceImplementation class] configuration:^(TyphoonDefinition *definition) {
        definition.scope = TyphoonScopeSingleton;
    }];
}

- (id <MotionService>)motionService {
    return [TyphoonDefinition withClass:[MotionServiceImplementation class] configuration:^(TyphoonDefinition *definition) {
        definition.scope = TyphoonScopeSingleton;
    }];
}

- (id <AnalyticsService>)analyticsService {
    return [TyphoonDefinition withClass:[AnalyticsServiceImplementation class] configuration:^(TyphoonDefinition *definition) {
        definition.scope = TyphoonScopeSingleton;
    }];
}

- (id <SettingsService>)settingsService {
    return [TyphoonDefinition withClass:[SettingsServiceImplementation class] configuration:^(TyphoonDefinition *definition) {
        definition.scope = TyphoonScopeSingleton;
    }];
}

@end
