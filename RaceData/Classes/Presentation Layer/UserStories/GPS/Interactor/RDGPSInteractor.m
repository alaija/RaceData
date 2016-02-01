//
//  RDGPSInteractor.m
//  RaceData
//
//  Created by alaija on 01/02/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import "RDGPSInteractor.h"

#import "RDGPSInteractorOutput.h"

static void *GPSLocationServiceContext = &GPSLocationServiceContext;

@implementation RDGPSInteractor

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if (context == GPSLocationServiceContext) {

        if ([keyPath isEqualToString:@"signalQuality"]) {
            CGFloat level = [change[@"new"] integerValue];
            
            [self.output signalQualityChanged:level];
        }
    }
}

#pragma mark - Методы RDRaceInfoInteractorInput

- (void)setupManagers
{
    [self.locationService addObserver:self
                           forKeyPath:@"signalQuality"
                              options:NSKeyValueObservingOptionNew
                              context:GPSLocationServiceContext];
    
    [self.locationService requestAccess];
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