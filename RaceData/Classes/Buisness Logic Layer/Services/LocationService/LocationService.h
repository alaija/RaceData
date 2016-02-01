//
//  LocationService.h
//  RaceData
//
//  Created by Alan Kochev on 09/01/16.
//  Copyright © 2016 Alan Kochev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

typedef NS_ENUM(NSUInteger, GPSSignalQuality) {
    GPSSignalQualityUnknown,
    GPSSignalQualityLow,
    GPSSignalQualityNormal,
    GPSSignalQualityHigh,
    GPSSignalQualityBest
};

@protocol LocationService <NSObject>

@property (nonatomic, readonly) CGFloat currentSpeed;
@property (nonatomic, readonly) GPSSignalQuality signalQuality;

- (void)startUpdates;
- (void)stopUpdates;
- (void)requestAccess;

@end
