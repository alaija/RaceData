//
//  RDRaceInfoInteractorInput.h
//  RaceData
//
//  Created by alaija on 12/12/2015.
//  Copyright 2015 RaceData. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RDRaceInfoInteractorInput <NSObject>

- (void)setupManagers;
- (void)startUpdates;
- (void)stopUpdates;

@end