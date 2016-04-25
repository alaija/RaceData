//
//  RDSpeedometerPresenter.m
//  RaceData
//
//  Created by alaija on 09/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import "RDSpeedometerPresenter.h"

#import "RDSpeedometerViewInput.h"
#import "RDSpeedometerInteractorInput.h"
#import "RDSpeedometerRouterInput.h"

@implementation RDSpeedometerPresenter

#pragma mark - Методы RDSpeedometerModuleInput

- (void)configureModule
{
    // Стартовая конфигурация модуля, не привязанная к состоянию view
}

#pragma mark - Методы RDSpeedometerViewOutput

- (void)didTriggerViewReadyEvent
{
	[self.view setupInitialState];
    [self.interactor setupManagers];
}

- (void)updateSettings:(RDSettingsObject *)settings
{
    [self.view setMetricSystem:settings.metric];
    [self.view setNightMode:settings.nightMode];
    [self.view setSpeedLimit:settings.speedLimit];
}

#pragma mark - Методы RDSpeedometerInteractorOutput

- (void)speedChanged:(CGFloat)newSpeed
{
    [self.view updateSpeed:newSpeed];
}

@end