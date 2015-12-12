//
//  RDRaceInfoPresenter.h
//  RaceData
//
//  Created by alaija on 12/12/2015.
//  Copyright 2015 RaceData. All rights reserved.
//

#import "RDRaceInfoViewOutput.h"
#import "RDRaceInfoInteractorOutput.h"
#import "RDRaceInfoModuleInput.h"

@protocol RDRaceInfoViewInput;
@protocol RDRaceInfoInteractorInput;
@protocol RDRaceInfoRouterInput;

@interface RDRaceInfoPresenter : NSObject <RDRaceInfoModuleInput, RDRaceInfoViewOutput, RDRaceInfoInteractorOutput>

@property (nonatomic, weak) id<RDRaceInfoViewInput> view;
@property (nonatomic, strong) id<RDRaceInfoInteractorInput> interactor;
@property (nonatomic, strong) id<RDRaceInfoRouterInput> router;

@end