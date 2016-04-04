//
//  RDSettingsRouter.h
//  RaceData
//
//  Created by alaija on 03/04/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import "RDSettingsRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface RDSettingsRouter : NSObject <RDSettingsRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end