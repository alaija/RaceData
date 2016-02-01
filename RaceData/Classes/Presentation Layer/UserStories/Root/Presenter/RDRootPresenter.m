//
//  RDRootPresenter.m
//  RaceData
//
//  Created by alaija on 27/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import "RDRootPresenter.h"

#import "RDRootViewInput.h"
#import "RDRootInteractorInput.h"
#import "RDRootRouterInput.h"

@implementation RDRootPresenter

#pragma mark - Методы RDRootModuleInput

- (void)configureModule {
    // Стартовая конфигурация модуля, не привязанная к состоянию view
}

#pragma mark - Методы RDRootViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
    [self showSpeedometer];
}

- (void)showSpeedometer
{
    [self.router showContentWithIdentifier:@"Speedometer"];
}

#pragma mark - Методы RDRootInteractorOutput

@end