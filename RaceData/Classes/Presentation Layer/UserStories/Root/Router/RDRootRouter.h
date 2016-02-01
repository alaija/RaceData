//
//  RDRootRouter.h
//  RaceData
//
//  Created by alaija on 27/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import "RDRootRouterInput.h"
#import "RDRootContentEmbedder.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface RDRootRouter : NSObject <RDRootRouterInput>

@property (nonatomic, weak) id<RDRootContentEmbedder> rootContentEmbeder;

@property (nonatomic, strong) NSDictionary *contentFactory;

@end