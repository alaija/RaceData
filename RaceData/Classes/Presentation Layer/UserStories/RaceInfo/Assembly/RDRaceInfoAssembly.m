//
//  RDRaceInfoAssembly.m
//  RaceData
//
//  Created by alaija on 12/12/2015.
//  Copyright 2015 RaceData. All rights reserved.
//

#import "RDRaceInfoAssembly.h"

#import "RDRaceInfoViewController.h"
#import "RDRaceInfoInteractor.h"
#import "RDRaceInfoPresenter.h"
#import "RDRaceInfoRouter.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation RDRaceInfoAssembly

- (RDRaceInfoViewController *)viewRaceInfoModule {
    return [TyphoonDefinition withClass:[RDRaceInfoViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterRaceInfoModule]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterRaceInfoModule]];
                          }];
}

- (RDRaceInfoInteractor *)interactorRaceInfoModule {
    return [TyphoonDefinition withClass:[RDRaceInfoInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterRaceInfoModule]];
                              [definition injectProperty:@selector(locationManager)
                                                    with:[self locationManager]];
                              [definition injectProperty:@selector(motionManager)
                                                    with:[self motionManager]];
                          }];
}

- (RDRaceInfoPresenter *)presenterRaceInfoModule {
    return [TyphoonDefinition withClass:[RDRaceInfoPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewRaceInfoModule]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorRaceInfoModule]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerRaceInfoModule]];
                          }];
}

- (RDRaceInfoRouter *)routerRaceInfoModule {
    return [TyphoonDefinition withClass:[RDRaceInfoRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewRaceInfoModule]];
                          }];
}

- (CLLocationManager *)locationManager
{
    return [TyphoonDefinition withClass:[CLLocationManager class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(delegate)
                                                    with:[self interactorRaceInfoModule]];
                              definition.scope = TyphoonScopeSingleton;
                          }];
}

- (CMMotionManager *)motionManager
{
    return [TyphoonDefinition withClass:[CMMotionManager class]
                          configuration:^(TyphoonDefinition *definition) {
                              definition.scope = TyphoonScopeSingleton;
                          }];
}

@end