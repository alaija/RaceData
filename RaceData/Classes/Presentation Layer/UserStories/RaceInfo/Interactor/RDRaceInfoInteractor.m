//
//  RDRaceInfoInteractor.m
//  RaceData
//
//  Created by alaija on 12/12/2015.
//  Copyright 2015 RaceData. All rights reserved.
//

#import "RDRaceInfoInteractor.h"

#import "RDRaceInfoInteractorOutput.h"
#import "math.h"

static CGFloat const RDRaceInfoInteractorKMPH = 3.6;

@interface RDRaceInfoInteractor()
@property (atomic, strong) NSTimer *locationPingTimer;
@property (nonatomic, strong) NSDate *startRecordTime;
@property (nonatomic) BOOL readyToStart;
@end

@implementation RDRaceInfoInteractor

#pragma mark - Internal methods

- (void)handleMotionData:(CMAcceleration)acceleration
{
    CGFloat acc = sqrt((pow(acceleration.x, 2) + pow(acceleration.y, 2) + pow(acceleration.z, 2)));

    if (fabs(1. - acc) > 0.1) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.output motionStarted];
        });
        [_motionManager stopAccelerometerUpdates];
    }
}

- (void)handleNewLocation:(CLLocation *)location
{
    if (location.speed > 0) {
        CGFloat currentSpeed = location.speed * RDRaceInfoInteractorKMPH;
        [self.output speedChanged:currentSpeed];
    }
}

- (void)setReadyToStart
{
    [self stopUpdates];
    [self.output didSetUpManagers];
    
    _readyToStart = YES;
}

#pragma mark - Методы RDRaceInfoInteractorInput

- (void)setupManagers
{
    self.motionManager.deviceMotionUpdateInterval = 0.01;
    
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    
    [self.locationManager requestWhenInUseAuthorization];
}



- (void)startUpdates
{
    [self.locationManager startUpdatingLocation];
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue new]
                                             withHandler:^(CMAccelerometerData * _Nullable accelerometerData,
                                                           NSError * _Nullable error) {
                                                if (!error)
                                                {
                                                    [self handleMotionData:accelerometerData.acceleration];
                                                }
                                            }];
}

- (void)stopUpdates
{
    [self.locationManager stopUpdatingLocation];
    [self.motionManager stopAccelerometerUpdates];
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
    
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat:@"HH:mm:ss.S"];
    
    //NSLog(@"LocationManager date: %@", [timeFormat stringFromDate:[NSDate date]]);
    
    BOOL isStaleLocation = (_startRecordTime != nil
                            && [oldLocation.timestamp compare:_startRecordTime] == NSOrderedAscending);
    
    NSTimeInterval ageInSeconds = [newLocation.timestamp timeIntervalSinceNow];
    
    [_locationPingTimer invalidate];
    
    if (!isStaleLocation
        && newLocation.horizontalAccuracy <= 10
        && fabs(ageInSeconds) <= 1) {
        
        if (_readyToStart) {
            [self handleNewLocation:newLocation];
        } else {
            [self setReadyToStart];
        }
    }
    
    // this will be invalidated above if a new location is received before it fires
    _locationPingTimer = [NSTimer timerWithTimeInterval:0.2 target:self selector:@selector(requestNewLocation) userInfo:nil repeats:NO];
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