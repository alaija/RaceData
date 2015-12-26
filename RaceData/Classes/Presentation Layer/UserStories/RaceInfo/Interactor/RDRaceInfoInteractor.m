//
//  RDRaceInfoInteractor.m
//  RaceData
//
//  Created by alaija on 12/12/2015.
//  Copyright 2015 RaceData. All rights reserved.
//

#import "RDRaceInfoInteractor.h"

#import "RDRaceInfoInteractorOutput.h"

static CGFloat const RDRaceInfoInteractorKMPH = 3.6;

@interface RDRaceInfoInteractor()
@property (atomic, strong) NSTimer *locationPingTimer;
@property (nonatomic, strong) NSDate *startRecordTime;
@property (nonatomic) BOOL readyToStart;
@property (nonatomic) CGFloat xAvg;
@property (nonatomic) CGFloat yAvg;
@property (nonatomic) CGFloat zAvg;
@property (nonatomic) NSUInteger motionsCount;
@end

@implementation RDRaceInfoInteractor

#pragma mark - Internal methods

- (CGFloat)updateAvg:(CGFloat)vAvg
           withValue:(CGFloat)v
{
    if (vAvg == -9) {
        return v;
    }
    
    if (fabs(fabs(vAvg) - fabs(v)) > 0.25)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.output motionStarted];
        });
        [_motionManager stopAccelerometerUpdates];
        return vAvg;
    } else {
        return (vAvg * _motionsCount + v)/(_motionsCount + 1);
    }
}

- (void)handleMotionData:(CMAcceleration)acceleration
{
    _motionsCount++;
    _xAvg = [self updateAvg:_xAvg withValue:acceleration.x];
    _yAvg = [self updateAvg:_yAvg withValue:acceleration.y];
    _zAvg = [self updateAvg:_zAvg withValue:acceleration.z];
    NSLog(@"%.2f, %.2f %.2f", _xAvg, _yAvg, _zAvg);
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
    
    _motionsCount = 0;
    _xAvg = -9;
    _yAvg = -9;
    _zAvg = -9;
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