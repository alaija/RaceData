//
//  RDRaceInfoInteractor.h
//  RaceData
//
//  Created by alaija on 12/12/2015.
//  Copyright 2015 RaceData. All rights reserved.
//

#import "RDRaceInfoInteractorInput.h"

@protocol RDRaceInfoInteractorOutput;

@interface RDRaceInfoInteractor : NSObject <RDRaceInfoInteractorInput>

@property (nonatomic, weak) id<RDRaceInfoInteractorOutput> output;

@end