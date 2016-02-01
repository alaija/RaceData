//
//  ServiceComponents.h
//  RaceData
//
//  Created by Alan Kochev on 09/01/16.
//  Copyright © 2016 Alan Kochev. All rights reserved.
//

@protocol LocationService;
@protocol MotionService;

@protocol ServiceComponents <NSObject>

- (id <LocationService>)locationService;
- (id <MotionService>)motionService;

@end