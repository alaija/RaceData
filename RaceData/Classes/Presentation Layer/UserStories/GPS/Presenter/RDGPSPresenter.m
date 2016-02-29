//
//  RDGPSPresenter.m
//  RaceData
//
//  Created by alaija on 01/02/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import "RDGPSPresenter.h"

#import "RDGPSViewInput.h"
#import "RDGPSInteractorInput.h"
#import "RDGPSRouterInput.h"

@implementation RDGPSPresenter

#pragma mark - Методы RDGPSModuleInput

- (void)configureModule
{
    // Стартовая конфигурация модуля, не привязанная к состоянию view
}

#pragma mark - Методы RDGPSViewOutput

- (void)didTriggerViewReadyEvent
{
	[self.view setupInitialState];
    [self.interactor setupManagers];
}

#pragma mark - Методы RDGPSInteractorOutput

- (void)signalQualityChanged:(NSUInteger)level
{
    [self.view updateSignalQualityLevel:level];
}
@end