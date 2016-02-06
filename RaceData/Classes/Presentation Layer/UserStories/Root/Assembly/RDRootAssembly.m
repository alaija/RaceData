//
//  RDRootAssembly.m
//  RaceData
//
//  Created by alaija on 27/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import "RDRootAssembly.h"

#import "RDRootViewController.h"
#import "RDRootInteractor.h"
#import "RDRootPresenter.h"
#import "RDRootRouter.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

#import "RDSpeedometerAssembly.h"
#import "RDRaceInfoAssembly.h"

@interface RDRootAssembly()
@property (nonatomic, strong, readonly) RDSpeedometerAssembly *speedometerAssembly;
@property (nonatomic, strong, readonly) RDRaceInfoAssembly *raceInfoAssembly;
@end

@implementation RDRootAssembly

- (RDRootViewController *)viewRootModule {
    return [TyphoonDefinition withClass:[RDRootViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterRootModule]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterRootModule]];
                          }];
}

- (RDRootInteractor *)interactorRootModule {
    return [TyphoonDefinition withClass:[RDRootInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterRootModule]];
                          }];
}

- (RDRootPresenter *)presenterRootModule {
    return [TyphoonDefinition withClass:[RDRootPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewRootModule]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorRootModule]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerRootModule]];
                          }];
}

- (RDRootRouter *)routerRootModule {
    return [TyphoonDefinition withClass:[RDRootRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(rootContentEmbeder)
                                                    with:[self viewRootModule]];
                              [definition injectProperty:@selector(contentFactory)
                                                    with:[self content]];
                          }];
}

- (NSDictionary *)content
{
    return @{ @"Speedometer": [self.speedometerAssembly speedometerContent],
              @"RaceInfo"   : [self.raceInfoAssembly raceInfoContent] };
}
@end