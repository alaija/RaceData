//
//  RDGPSPresenter.h
//  RaceData
//
//  Created by alaija on 01/02/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import "RDGPSViewOutput.h"
#import "RDGPSInteractorOutput.h"
#import "RDGPSModuleInput.h"

@protocol RDGPSViewInput;
@protocol RDGPSInteractorInput;
@protocol RDGPSRouterInput;

@interface RDGPSPresenter : NSObject <RDGPSModuleInput, RDGPSViewOutput, RDGPSInteractorOutput>

@property (nonatomic, weak) id<RDGPSViewInput> view;
@property (nonatomic, strong) id<RDGPSInteractorInput> interactor;
@property (nonatomic, strong) id<RDGPSRouterInput> router;

@end