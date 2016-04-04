//
//  ServiceComponents.h
//  RaceData
//
//  Created by Alan Kochev on 09/01/16.
//  Copyright © 2016 Alan Kochev. All rights reserved.
//

@protocol LocationService, MotionService, AnalyticsService, SettingsService;

@protocol ServiceComponents <NSObject>

- (id <LocationService>)locationService;
- (id <MotionService>)motionService;
- (id <AnalyticsService>)analyticsService;
- (id <SettingsService>)settingsService;

@end