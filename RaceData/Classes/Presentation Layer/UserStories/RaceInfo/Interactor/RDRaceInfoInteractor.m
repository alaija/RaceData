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

static void *RaceInfoLocationServiceContext = &RaceInfoLocationServiceContext;
static void *RaceInfoMotionServiceContext = &RaceInfoMotionServiceContext;

@interface RDRaceInfoInteractor()
@property (nonatomic) BOOL readyToStart;
@end

@implementation RDRaceInfoInteractor

#pragma mark - Internal methods

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if (context == RaceInfoLocationServiceContext) {
        
        if ([keyPath isEqualToString:@"currentSpeed"]) {
            CGFloat newSpeed = [change[@"new"] floatValue];
            
            if (newSpeed >= 0 ) {
                [self.output speedChanged:newSpeed];
            }
        } else if ([keyPath isEqualToString:@"signalQuality"]){
            GPSSignalQuality quality = [change[@"new"] integerValue];
            
            if (quality >= GPSSignalQualityHigh) {
                [self.output didSetUpManagers];
                
                [self.locationService removeObserver:self
                                          forKeyPath:@"signalQuality"
                                             context:RaceInfoLocationServiceContext];
                
            } else {
                // Low signal race should be stopped
            }
        }
    } else if (context == RaceInfoMotionServiceContext) {
        if ([keyPath isEqualToString:@"currentAcceleration"]) {
            CGFloat newAcc = [change[@"new"] floatValue];
            if (fabs(1. - newAcc) > 0.1) {
                [self.output motionStarted];
            }
        }
    }
}

#pragma mark - Методы RDRaceInfoInteractorInput

- (void)setupManagers
{
    [self.locationService addObserver:self
                           forKeyPath:@"signalQuality"
                              options:NSKeyValueObservingOptionNew
                              context:RaceInfoLocationServiceContext];
    
    [self.locationService addObserver:self
                           forKeyPath:@"currentSpeed"
                              options:NSKeyValueObservingOptionNew
                              context:RaceInfoLocationServiceContext];
    
    [self.locationService requestAccess];
    
    [self.motionService addObserver:self
                         forKeyPath:@"currentAcceleration"
                            options:NSKeyValueObservingOptionNew
                            context:RaceInfoMotionServiceContext];
    
    [self updateSettings];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateSettings)
                                                 name:RDSettingsDidUpdate
                                               object:nil];
}

- (void)updateSettings
{
    self.locationService.metric = self.settingsService.settings.metric;
     [self.output updateSettings:self.settingsService.settings];
}

- (void)startUpdates
{
    [self.motionService startUpdates];
    [self.locationService startUpdates];
}

- (void)stopUpdates
{
    [self.motionService stopUpdates];
    [self.locationService stopUpdates];
}

@end