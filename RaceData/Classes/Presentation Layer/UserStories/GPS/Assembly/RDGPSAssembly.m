//
//  RDGPSAssembly.m
//  RaceData
//
//  Created by alaija on 01/02/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import "RDGPSAssembly.h"

#import "RDGPSViewController.h"
#import "RDGPSInteractor.h"
#import "RDGPSPresenter.h"
#import "RDGPSRouter.h"
#import "ServiceComponents.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation RDGPSAssembly

- (RDGPSViewController *)viewGPSModule {
    return [TyphoonDefinition withClass:[RDGPSViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterGPSModule]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterGPSModule]];
                          }];
}

- (RDGPSInteractor *)interactorGPSModule {
    return [TyphoonDefinition withClass:[RDGPSInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterGPSModule]];
                              [definition injectProperty:@selector(locationService)
                                                    with:[self.serviceComponents locationService]];
                          }];
}

- (RDGPSPresenter *)presenterGPSModule {
    return [TyphoonDefinition withClass:[RDGPSPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewGPSModule]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorGPSModule]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerGPSModule]];
                          }];
}

- (RDGPSRouter *)routerGPSModule {
    return [TyphoonDefinition withClass:[RDGPSRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewGPSModule]];
                          }];
}

- (id<RDEmbeddedContent>)gpsContent
{
    return [self viewGPSModule];
}

@end