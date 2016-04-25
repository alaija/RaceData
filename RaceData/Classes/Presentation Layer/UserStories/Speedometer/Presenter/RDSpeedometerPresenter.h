//
//  RDSpeedometerPresenter.h
//  RaceData
//
//  Created by alaija on 09/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import "RDSpeedometerViewOutput.h"
#import "RDSpeedometerInteractorOutput.h"
#import "RDSpeedometerModuleInput.h"
#import "SettingsService.h"

@protocol RDSpeedometerViewInput;
@protocol RDSpeedometerInteractorInput;
@protocol RDSpeedometerRouterInput;

@interface RDSpeedometerPresenter : NSObject <RDSpeedometerModuleInput, RDSpeedometerViewOutput, RDSpeedometerInteractorOutput>

@property (nonatomic, weak) id<RDSpeedometerViewInput> view;
@property (nonatomic, strong) id<RDSpeedometerInteractorInput> interactor;
@property (nonatomic, strong) id<RDSpeedometerRouterInput> router;

@end