//
//  RDSpeedometerAssembly_Testable.h
//  RaceData
//
//  Created by alaija on 09/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import "RDSpeedometerAssembly.h"

@class RDSpeedometerViewController;
@class RDSpeedometerInteractor;
@class RDSpeedometerPresenter;
@class RDSpeedometerRouter;

@interface RDSpeedometerAssembly ()

- (RDSpeedometerViewController *)viewSpeedometerModule;
- (RDSpeedometerPresenter *)presenterSpeedometerModule;
- (RDSpeedometerInteractor *)interactorSpeedometerModule;
- (RDSpeedometerRouter *)routerSpeedometerModule;

@end