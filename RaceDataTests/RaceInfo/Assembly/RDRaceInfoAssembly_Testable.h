//
//  RDRaceInfoAssembly_Testable.h
//  RaceData
//
//  Created by alaija on 12/12/2015.
//  Copyright 2015 RaceData. All rights reserved.
//

#import "RDRaceInfoAssembly.h"

@class RDRaceInfoViewController;
@class RDRaceInfoInteractor;
@class RDRaceInfoPresenter;
@class RDRaceInfoRouter;

@interface RDRaceInfoAssembly ()

- (RDRaceInfoViewController *)viewRaceInfoModule;
- (RDRaceInfoPresenter *)presenterRaceInfoModule;
- (RDRaceInfoInteractor *)interactorRaceInfoModule;
- (RDRaceInfoRouter *)routerRaceInfoModule;

@end