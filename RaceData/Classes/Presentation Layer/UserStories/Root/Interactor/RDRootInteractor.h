//
//  RDRootInteractor.h
//  RaceData
//
//  Created by alaija on 27/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import "RDRootInteractorInput.h"

@protocol RDRootInteractorOutput;

@interface RDRootInteractor : NSObject <RDRootInteractorInput>

@property (nonatomic, weak) id<RDRootInteractorOutput> output;

@end