//
//  RDSettingsAssembly_Testable.h
//  RaceData
//
//  Created by alaija on 03/04/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import "RDSettingsAssembly.h"

@class RDSettingsViewController;
@class RDSettingsInteractor;
@class RDSettingsPresenter;
@class RDSettingsRouter;

@interface RDSettingsAssembly ()

- (RDSettingsViewController *)viewSettingsModule;
- (RDSettingsPresenter *)presenterSettingsModule;
- (RDSettingsInteractor *)interactorSettingsModule;
- (RDSettingsRouter *)routerSettingsModule;

@end