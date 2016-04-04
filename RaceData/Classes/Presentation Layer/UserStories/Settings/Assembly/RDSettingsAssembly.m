//
//  RDSettingsAssembly.m
//  RaceData
//
//  Created by alaija on 03/04/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import "RDSettingsAssembly.h"

#import "RDSettingsViewController.h"
#import "RDSettingsInteractor.h"
#import "RDSettingsPresenter.h"
#import "RDSettingsRouter.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation RDSettingsAssembly

- (RDSettingsViewController *)viewSettingsModule {
    return [TyphoonDefinition withClass:[RDSettingsViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterSettingsModule]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterSettingsModule]];
                          }];
}

- (RDSettingsInteractor *)interactorSettingsModule {
    return [TyphoonDefinition withClass:[RDSettingsInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterSettingsModule]];
                          }];
}

- (RDSettingsPresenter *)presenterSettingsModule {
    return [TyphoonDefinition withClass:[RDSettingsPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewSettingsModule]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorSettingsModule]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerSettingsModule]];
                          }];
}

- (RDSettingsRouter *)routerSettingsModule {
    return [TyphoonDefinition withClass:[RDSettingsRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewSettingsModule]];
                          }];
}

@end