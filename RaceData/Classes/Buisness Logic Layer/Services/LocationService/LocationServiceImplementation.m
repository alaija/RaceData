//
//  LocationServiceImplementation.m
//  RaceData
//
//  Created by Alan Kochev on 09/01/16.
//  Copyright © 2016 Alan Kochev. All rights reserved.
//

#import "LocationServiceImplementation.h"
#import <CoreLocation/CoreLocation.h>

static CGFloat const LocationServiceImplementationKMPH = 3.6;

@interface LocationServiceImplementation() <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

@property (nonatomic) CGFloat currentSpeed;
@property (nonatomic) GPSSignalQuality signalQuality;

@property (nonatomic, strong) NSTimer *locationPingTimer;
@property (nonatomic, strong) NSDate *startRecordTime;

@property (nonatomic) BOOL updating;

@end

@implementation LocationServiceImplementation

- (instancetype)init
{
    self = [super init];
    if (self) {
        _currentSpeed = 0;
        _signalQuality = GPSSignalQualityUnknown;
        _locationManager = [CLLocationManager new];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
        _locationManager.distanceFilter = kCLDistanceFilterNone;
    }
    return self;
}

- (void)startUpdates
{
    _updating = YES;
    _startRecordTime = [NSDate date];
    [self.locationManager startUpdatingLocation];
}

- (void)stopUpdates
{
    _updating = NO;
    self.currentSpeed = 0.;
    [self.locationManager stopUpdatingLocation];
}

- (void)requestAccess
{
    [self.locationManager requestWhenInUseAuthorization];
}

- (void)handleNewLocation:(CLLocation *)location
{
    self.currentSpeed = ((location.speed <= 0.
                          && _signalQuality >= GPSSignalQualityNormal)
                         ? 0.
                         : location.speed * LocationServiceImplementationKMPH);
}

#pragma mark - Core Location

-(void)locationManager:(CLLocationManager *)manager
didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status) {
        case kCLAuthorizationStatusNotDetermined:
        case kCLAuthorizationStatusRestricted:
        case kCLAuthorizationStatusDenied: {
            // do some error handling
            break;
        }
        default: {
            
            [self.locationManager startUpdatingLocation];
            break;
        }
    }
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    if (oldLocation == nil) return;
    
    BOOL isStaleLocation = (_startRecordTime != nil
                            && [oldLocation.timestamp compare:_startRecordTime] == NSOrderedAscending);
    
    NSTimeInterval ageInSeconds = [newLocation.timestamp timeIntervalSinceNow];
    
    [_locationPingTimer invalidate];
    
    if (!isStaleLocation
        && fabs(ageInSeconds) <= 1) {
        
        if (newLocation.horizontalAccuracy <= 5) {
            self.signalQuality = GPSSignalQualityBest;
        } else if (newLocation.horizontalAccuracy <= 10) {
            self.signalQuality = GPSSignalQualityHigh;
        } else if (newLocation.horizontalAccuracy <= 25) {
            self.signalQuality = GPSSignalQualityNormal;
        } else {
            self.signalQuality = GPSSignalQualityLow;
        }
        
        [self handleNewLocation:newLocation];
    } else {
        self.signalQuality = GPSSignalQualityUnknown;
    }
    
    _locationPingTimer = [NSTimer timerWithTimeInterval:0.2
                                                 target:self
                                               selector:@selector(requestNewLocation)
                                               userInfo:nil
                                                repeats:NO];
    [[NSRunLoop mainRunLoop] addTimer:_locationPingTimer forMode:NSRunLoopCommonModes];
}

- (void)requestNewLocation
{
    [self.locationManager stopUpdatingLocation];
    [self.locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error {
    
    if (error.code == kCLErrorDenied) {
        
        [self.locationManager stopUpdatingLocation];
    }
}


@end
