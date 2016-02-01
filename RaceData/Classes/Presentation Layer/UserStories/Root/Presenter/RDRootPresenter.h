//
//  RDRootPresenter.h
//  RaceData
//
//  Created by alaija on 27/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import "RDRootViewOutput.h"
#import "RDRootInteractorOutput.h"
#import "RDRootModuleInput.h"

@protocol RDRootViewInput;
@protocol RDRootInteractorInput;
@protocol RDRootRouterInput;

@interface RDRootPresenter : NSObject <RDRootModuleInput, RDRootViewOutput, RDRootInteractorOutput>

@property (nonatomic, weak) id<RDRootViewInput> view;
@property (nonatomic, strong) id<RDRootInteractorInput> interactor;
@property (nonatomic, strong) id<RDRootRouterInput> router;

@end