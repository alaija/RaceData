//
//  RDSpeedometerInteractor.m
//  RaceData
//
//  Created by alaija on 09/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import "RDSpeedometerInteractor.h"
#import "RDSpeedometerInteractorOutput.h"

static void *SpeedometerLocationServiceContext = &SpeedometerLocationServiceContext;

@implementation RDSpeedometerInteractor

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if (context == SpeedometerLocationServiceContext) {
        
        if ([keyPath isEqualToString:@"currentSpeed"]) {
            CGFloat newSpeed = [change[@"new"] floatValue];
            
            if (newSpeed >= 0 ) {
                [self.output speedChanged:newSpeed];
            } else {
                [self.output speedChanged:0.];
            }
        }
    }
}

#pragma mark - Методы RDRaceInfoInteractorInput

- (void)setupManagers
{
    [self.locationService addObserver:self
                           forKeyPath:@"currentSpeed"
                              options:NSKeyValueObservingOptionNew
                              context:SpeedometerLocationServiceContext];
    
    [self.locationService requestAccess];
    
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
    [self.locationService startUpdates];
}

- (void)stopUpdates
{
    [self.locationService stopUpdates];
}

@end