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
    [self.router showContentWithIdentifier:@"Speedometer"];
    [self.router showGpsView];
}

- (void)navigateFromViewWithIdentifier:(NSString *)identifier
{
    NSString *nextViewIdentifier;
    
    if ([identifier isEqualToString:@"Speedometer"]) {
        nextViewIdentifier = @"RaceInfo";
    } else {
        nextViewIdentifier = @"Speedometer";
    }
    
    [self.router showContentWithIdentifier:nextViewIdentifier];
}

- (void)showSettings
{
    [self.router showContentWithIdentifier:@"Settings"];
}

#pragma mark - Методы RDRootInteractorOutput

@end