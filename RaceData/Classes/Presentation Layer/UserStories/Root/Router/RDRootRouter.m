//
//  RDRootRouter.m
//  RaceData
//
//  Created by alaija on 27/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import "RDRootRouter.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation RDRootRouter

#pragma mark - Методы RDRootRouterInput

- (void)showContentWithIdentifier:(NSString *)identifier
{
    id <RDRootContent> content = self.contentFactory[identifier];
    
    [self.rootContentEmbeder embedContent:content];
}

@end