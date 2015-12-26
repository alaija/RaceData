//
//  RDRaceInfoPresenter.m
//  RaceData
//
//  Created by alaija on 12/12/2015.
//  Copyright 2015 RaceData. All rights reserved.
//

#import "RDRaceInfoPresenter.h"

#import "RDRaceInfoViewInput.h"
#import "RDRaceInfoInteractorInput.h"
#import "RDRaceInfoRouterInput.h"

@implementation RDRaceInfoPresenter

#pragma mark - Методы RDRaceInfoModuleInput

- (void)configureModule {
    // Стартовая конфигурация модуля, не привязанная к состоянию view
}

#pragma mark - Методы RDRaceInfoViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
    [self.interactor setupManagers];
}

- (void)didTriggerRaceStartEvent
{
    [self.interactor startUpdates];
    [self.view setupRaceState];
}

- (void)didTriggerRaceStopEvent
{
    [self.interactor stopUpdates];
    [self.view setupReadyToStartState];
}

#pragma mark - Методы RDRaceInfoInteractorOutput

- (void)didSetUpManagers
{
    [self.view setupReadyToStartState];
}

- (void)motionStarted
{
    [self.view updateMotionStartTime];
}

- (void)speedChanged:(CGFloat)newSpeed
{
    [self.view updateSpeed:newSpeed];
}

@end