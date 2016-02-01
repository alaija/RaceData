//
//  RDGPSRouter.h
//  RaceData
//
//  Created by alaija on 01/02/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import "RDGPSRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface RDGPSRouter : NSObject <RDGPSRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end