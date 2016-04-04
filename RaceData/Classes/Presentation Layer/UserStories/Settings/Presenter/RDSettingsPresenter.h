//
//  RDSettingsPresenter.h
//  RaceData
//
//  Created by alaija on 03/04/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import "RDSettingsViewOutput.h"
#import "RDSettingsInteractorOutput.h"
#import "RDSettingsModuleInput.h"

@protocol RDSettingsViewInput;
@protocol RDSettingsInteractorInput;
@protocol RDSettingsRouterInput;

@interface RDSettingsPresenter : NSObject <RDSettingsModuleInput, RDSettingsViewOutput, RDSettingsInteractorOutput>

@property (nonatomic, weak) id<RDSettingsViewInput> view;
@property (nonatomic, strong) id<RDSettingsInteractorInput> interactor;
@property (nonatomic, strong) id<RDSettingsRouterInput> router;

@end