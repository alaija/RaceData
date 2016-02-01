//
//  RDRootAssembly_Testable.h
//  RaceData
//
//  Created by alaija on 27/01/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import "RDRootAssembly.h"

@class RDRootViewController;
@class RDRootInteractor;
@class RDRootPresenter;
@class RDRootRouter;

@interface RDRootAssembly ()

- (RDRootViewController *)viewRootModule;
- (RDRootPresenter *)presenterRootModule;
- (RDRootInteractor *)interactorRootModule;
- (RDRootRouter *)routerRootModule;

@end