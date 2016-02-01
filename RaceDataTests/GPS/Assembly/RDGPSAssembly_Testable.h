//
//  RDGPSAssembly_Testable.h
//  RaceData
//
//  Created by alaija on 01/02/2016.
//  Copyright 2016 RaceData. All rights reserved.
//

#import "RDGPSAssembly.h"

@class RDGPSViewController;
@class RDGPSInteractor;
@class RDGPSPresenter;
@class RDGPSRouter;

@interface RDGPSAssembly ()

- (RDGPSViewController *)viewGPSModule;
- (RDGPSPresenter *)presenterGPSModule;
- (RDGPSInteractor *)interactorGPSModule;
- (RDGPSRouter *)routerGPSModule;

@end