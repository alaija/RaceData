//
//  RDRaceInfoRouter.h
//  RaceData
//
//  Created by alaija on 12/12/2015.
//  Copyright 2015 RaceData. All rights reserved.
//

#import "RDRaceInfoRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface RDRaceInfoRouter : NSObject <RDRaceInfoRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end