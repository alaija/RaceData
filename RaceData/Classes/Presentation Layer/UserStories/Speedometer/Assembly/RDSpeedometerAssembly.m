//
//  RDSpeedometerAssembly.m
//  RaceData
//
//  Created by alaija on 09/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import "RDSpeedometerAssembly.h"

#import "RDSpeedometerViewController.h"
#import "RDSpeedometerInteractor.h"
#import "RDSpeedometerPresenter.h"
#import "RDSpeedometerRouter.h"
#import "ServiceComponents.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation RDSpeedometerAssembly

- (RDSpeedometerViewController *)viewSpeedometerModule {
    return [TyphoonDefinition withClass:[RDSpeedometerViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterSpeedometerModule]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterSpeedometerModule]];
                          }];
}

- (RDSpeedometerInteractor *)interactorSpeedometerModule {
    return [TyphoonDefinition withClass:[RDSpeedometerInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterSpeedometerModule]];
                              [definition injectProperty:@selector(locationService)
                                                    with:[self.serviceComponents locationService]];
                              [definition injectProperty:@selector(settingsService)
                                                    with:[self.serviceComponents settingsService]];
                          }];
}

- (RDSpeedometerPresenter *)presenterSpeedometerModule {
    return [TyphoonDefinition withClass:[RDSpeedometerPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewSpeedometerModule]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorSpeedometerModule]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerSpeedometerModule]];
                          }];
}

- (RDSpeedometerRouter *)routerSpeedometerModule {
    return [TyphoonDefinition withClass:[RDSpeedometerRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewSpeedometerModule]];
                          }];
}

- (id<RDRootContent>)speedometerContent
{
    return [self viewSpeedometerModule];
}

@end