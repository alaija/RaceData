//
//  RDSettingsPresenter.m
//  RaceData
//
//  Created by alaija on 03/04/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import "RDSettingsPresenter.h"

#import "RDSettingsViewInput.h"
#import "RDSettingsInteractorInput.h"
#import "RDSettingsRouterInput.h"

@implementation RDSettingsPresenter

#pragma mark - Методы RDSettingsModuleInput

- (void)configureModule {
    // Стартовая конфигурация модуля, не привязанная к состоянию view
}

#pragma mark - Методы RDSettingsViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
}

#pragma mark - Методы RDSettingsInteractorOutput

@end