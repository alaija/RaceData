//
//  RDSpeedometerRouter.h
//  RaceData
//
//  Created by alaija on 09/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import "RDSpeedometerRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface RDSpeedometerRouter : NSObject <RDSpeedometerRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end